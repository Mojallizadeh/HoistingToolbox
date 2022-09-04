function [x_d,v_d,a_d] = trajectory(t,traj_number,sin_traj_w,sin_traj_A)
% This function is to generate the trajectories.



%traj_number=1;
    if traj_number==1
        % SE trajectory
       
         if t < 4
                x_d=3.5*t^2/8+1;
                v_d=3.5*t/4;
                a_d=3.5/4;
         elseif t < 8
                x_d=3.5*t-7+1;
                v_d=3.5;
                a_d=0;
         elseif t< 12
                x_d=-3.5*t^2/8.0+10.5*t-35+1;
                v_d=-3.5*t/4.+10.5;
                a_d=-3.5/4;
         else
                x_d=28+1;
                v_d=0;
                a_d=0;
         end

    elseif traj_number==2
       % Sine without initial error
        A=sin_traj_A;  % default 5
        w=sin_traj_w;  % default 0.2

        x_d=A*sin(w*t)-A*w*t;
        v_d=A*w*cos(w*t)-A*w;
        a_d=-A*w^2*sin(w*t);
    elseif traj_number==3
        % Sine with initial error
        A=sin_traj_A;  % default 5
        w=sin_traj_w;  % default 0.2
        x_d=A*sin(w*t);
        v_d=A*w*cos(w*t);
        a_d=-A*w^2*sin(w*t);
    else
        disp('Error!')
        pause
        x_d=0;
        v_d=0;
        a_d=0;
        
    end


