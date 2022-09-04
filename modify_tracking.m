method_select=3;
N=method_select;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%`
parameters
sin_traj_w=0.05;

t=0;
for j=1:t_f/h
    t=t+h;
    [~,~,a_d_full_x(j)]=trajectory(t,traj_number,sin_traj_w,sin_traj_A);
end

a_d_full_y=circshift(a_d_full_x,floor(1/h))/2;

for j=1:floor(1/h)
    a_d_full_y(j)=0;
end


out=sim('Crane_rigid.slx');
evaluation
load tracking_data norm_2_e_payload_save
norm_2_e_payload_save(1,N)=norm_2_e_payload;
save('tracking_data.mat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameters
sin_traj_w=0.1;


t=0;
for j=1:t_f/h
    t=t+h;
    [~,~,a_d_full_x(j)]=trajectory(t,traj_number,sin_traj_w,sin_traj_A);
end

a_d_full_y=circshift(a_d_full_x,floor(1/h))/2;

for j=1:floor(1/h)
    a_d_full_y(j)=0;
end

out=sim('Crane_rigid.slx');
evaluation
load tracking_data norm_2_e_payload_save
norm_2_e_payload_save(2,N)=norm_2_e_payload;
save('tracking_data.mat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameters
sin_traj_w=0.2;


t=0;
for j=1:t_f/h
    t=t+h;
    [~,~,a_d_full_x(j)]=trajectory(t,traj_number,sin_traj_w,sin_traj_A);
end

a_d_full_y=circshift(a_d_full_x,floor(1/h))/2;

for j=1:floor(1/h)
    a_d_full_y(j)=0;
end

out=sim('Crane_rigid.slx');
evaluation
load tracking_data norm_2_e_payload_save
norm_2_e_payload_save(3,N)=norm_2_e_payload;
save('tracking_data.mat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameters
sin_traj_w=0.3;


t=0;
for j=1:t_f/h
    t=t+h;
    [~,~,a_d_full_x(j)]=trajectory(t,traj_number,sin_traj_w,sin_traj_A);
end

a_d_full_y=circshift(a_d_full_x,floor(1/h))/2;

for j=1:floor(1/h)
    a_d_full_y(j)=0;
end

out=sim('Crane_rigid.slx');
evaluation
load tracking_data norm_2_e_payload_save
norm_2_e_payload_save(4,N)=norm_2_e_payload;
save('tracking_data.mat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameters
sin_traj_w=0.4;


t=0;
for j=1:t_f/h
    t=t+h;
    [~,~,a_d_full_x(j)]=trajectory(t,traj_number,sin_traj_w,sin_traj_A);
end

a_d_full_y=circshift(a_d_full_x,floor(1/h))/2;

for j=1:floor(1/h)
    a_d_full_y(j)=0;
end

out=sim('Crane_rigid.slx');
evaluation
load tracking_data norm_2_e_payload_save
norm_2_e_payload_save(5,N)=norm_2_e_payload;
save('tracking_data.mat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
parameters
sin_traj_w=0.5;



t=0;
for j=1:t_f/h
    t=t+h;
    [~,~,a_d_full_x(j)]=trajectory(t,traj_number,sin_traj_w,sin_traj_A);
end

a_d_full_y=circshift(a_d_full_x,floor(1/h))/2;

for j=1:floor(1/h)
    a_d_full_y(j)=0;
end

out=sim('Crane_rigid.slx');
evaluation
load tracking_data norm_2_e_payload_save
norm_2_e_payload_save(6,N)=norm_2_e_payload;
save('tracking_data.mat')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%