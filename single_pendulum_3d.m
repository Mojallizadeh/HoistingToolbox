function J = single_pendulum_3d(in,cont_select,eval)

parameters
clear cont_param_4 cont_param_5 cont_param_6 cont_param_7 cont_param_8 cont_param_9 cont_param_10 cont_param_11 cont_param_12 cont_param_13 cont_param_14 cont_param_15 cont_param_16 cont_param_17  cont_param_18 cont_param_19 cont_param_20

clear control_5_quasi_PID LF control_18_coupling_tracking_first control_19_coupling_tracking_last control_20_coupling_tracking_3d_first

cont_param_4=in;
cont_param_5=in;
cont_param_6=in;
cont_param_7=in;
cont_param_8=in;
cont_param_9=in;
cont_param_10=in;
cont_param_11=in;
cont_param_12=in;
cont_param_13=in;
cont_param_14=in;
cont_param_15=in;
cont_param_16=in;
cont_param_17=in;
cont_param_18=in;
cont_param_19=in;
cont_param_20=in;

dt=1e-3;
disturbance_vector=zeros(1,floor(t_f/dt));

jj=0;
sgn_dist=1;
for j=1:size(disturbance_vector)
    jj=jj+1;
    disturbance_vector_x(j)=sgn_dist*cart_disturbance_amp;
    if jj ==  dt*disturbance_period/2
        jj=0;
        sgn_dist=-sgn_dist;
    end
end


disturbance_vector_y = delayseq(disturbance_vector_x',2,1/dt)'/2;


len=floor(t_f/dt);






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x(k+1)=dt*(x_dot(k))+x(k);
y(k+1)=dt*(y_dot(k))+y(k);
theta_x(k+1)=dt*(theta_x_dot(k))+theta_x(k);
theta_y(k+1)=dt*(theta_y_dot(k))+theta_y(k);





x_dot(k+1)=dt*(Fx+m*l*CX*CY*)+x_dot(k+1);








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%









q=zeros(3,len);
q_dot=zeros(3,len);
q(:,1)=(pi/180)*[0;first_link_sway+all_initial_sway;-all_initial_sway];
q_dot(:,1)=[0;0;0];
theta_1=0;
theta_2=0;

xd=zeros(1,len);
xp=zeros(1,len);
F=zeros(1,len);
F_filtered=zeros(1,len);
varc=0; % initial variation on the control signal
counter_stopping_loop=0;
run_flag=1;
break_force_coefficient=0;


S = RandStream('mt19937ar','Seed',67); % noise generator seed

for k=1:len
    
%==================== plant's parameters ==================================
	t=dt*k;
    m12=(cart_mass+hook_mass)*cable_length*cos(q(2,k));
    m23=hook_mass*cable_length*last_piece_length*cos(q(2,k)-q(3,k));
    M=[payload_mass+cart_mass+hook_mass      m12     hook_mass*last_piece_length*cos(q(3,k));...
        m12   (cart_mass+hook_mass)*cable_length^2  m23 ;...
        hook_mass*last_piece_length*cos(q(3,k)) m23  hook_mass*last_piece_length^2];
    c12=-(cart_mass+hook_mass)*cable_length*q_dot(2,k) * sin(q(2,k));
    c32=-hook_mass*cable_length*last_piece_length*q_dot(2,k)*sin(q(2,k)-q(3,k));
    C=[0 c12 -hook_mass*last_piece_length*q_dot(3,k) * sin(q(3,k));...
        0 0 hook_mass*cable_length*last_piece_length*q_dot(3,k)*sin(q(2,k)-q(3,k));...
        0 c32 0];
	G=[0 ; (cart_mass+hook_mass)*g*cable_length*sin(q(2,k)) ; hook_mass*g*last_piece_length*sin(q(3,k))];   
	[xd(k),vd,ad] = trajectory(t,traj_number);
%==========================================================================
    
%======================= The control law ================================== 

    if k*dt>delay_time
        kc=k-100;
        if rem(t,h)==0
            %x=q(1,kc);
            x=awgn(q(1,kc),SNR_value,1,S);
%             v=q_dot(1,kc);
            v=awgn(q_dot(1,kc),SNR_value,1,S);
%             theta_1=q(2,kc);
            theta_1=awgn(q(2,kc),SNR_value,1,S);
%             theta_2=q(3,kc);
            theta_2=awgn(q(3,kc),SNR_value,1,S);
%             theta1_dot=q_dot(2,kc);
            theta1_dot=awgn(q_dot(2,kc),SNR_value,1,S);
%             theta2_dot=q_dot(3,kc);   
           theta2_dot=awgn(q_dot(3,kc),SNR_value,1,S);
            F(k) = Controllers(x,xd(kc),v,vd,theta_1,theta_2,theta1_dot,theta2_dot,cart_mass,hook_mass,total_mass,ad,a_d_full,h,t_f,t,cont_param_4,cont_param_5,cont_param_6,cont_param_7,cont_param_8,cont_param_9,cont_param_10,cont_param_11,cont_param_12,cont_param_13,cont_param_14,cont_param_15,cont_param_16,cont_param_17,cont_param_18,cont_param_19,cont_select,cart_mass,payload_mass,cable_mass_total,cable_length,last_piece_length);
            if isnan(F(k))
                F(k)=0;
            end
            varc=abs(F(k)-F(k-1))+varc;
        elseif rem(t,h)~=0
            F(k)=F(k-1);
        end
    else
        F(k)=0;
    end
    
%================= Actuator dynamic ==================================    
    
    F_filtered(k+1)=dt*c_actuator*(F(k)-F_filtered(k))+F_filtered(k);
    
%==========================================================================    
    
%================= closed-loop equations ==================================
	U=[run_flag*max(min(F_filtered(k),sat_const),-sat_const)-break_force_coefficient*q_dot(1,k)-trolley_damping*q_dot(1,k)+disturbance_vector(k);-10000*damping_coefficient*q_dot(2,k);-10000*damping_coefficient*q_dot(3,k)];
	q_dot(:,k+1)=dt*(M\(U-C*q_dot(:,k)-G))+q_dot(:,k);
%     if max(max(isnan(q_dot(:,k+1))))
%         M
%         eig(M)
%         q_dot(:,k+1)
%         min(min(abs(M)))
%         pause
%     end
	q(:,k+1)=dt*(q_dot(:,k))+q(:,k);
    xp(k)=q(1,k)+cable_length*sin(q(2,k))+last_piece_length*sin(q(3,k));
%==========================================================================    

%==================== Stopping condition===================================    
    if abs(theta_1)+abs(theta_2)<0.1*pi/180 && abs(q_dot(1,k))<3.5*0.02 && abs(q(1,k)-xd(k))<0.1
        counter_stopping_loop=counter_stopping_loop+1;
    else
         counter_stopping_loop=0;
    end
    
    if counter_stopping_loop*dt>8
        run_flag=0;
        break_force_coefficient=1e6;
    end
   
end

ep=xp-xd;
ind1=floor(len/6):len;
ind2=floor(len/3):len;
ind3=floor(len/10):len;

J=norm(ep,2)+600*norm(ep(ind3),inf)+60*norm(ep(ind1),2)+300*norm(ep(ind2),2)+5e-2*varc; % For piecewise

if eval==1
    t=0:dt:t_f;
    xd(end+1)=xd(end);
    xp(end+1)=xp(end);
    F(end+1)=F(end);
    plot(t,xd)
    hold on
    plot(t,xp)
    grid on
    figure
    plot(t,max(min(F,sat_const),-sat_const))
    
end


end
