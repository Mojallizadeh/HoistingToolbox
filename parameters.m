load parameters_file

% ======== Modifiable parameters==========================================

% ----------------Trajectories--------------------------------------------
   traj_type="piecewise"; traj_number=1; % SE
%    traj_type="sinusoidal without initial error";  traj_number=2;
%    traj_type="sinusoidal with initial error";  traj_number=3;
   sin_traj_A=5;  % default 5
   sin_traj_w=0.02;  % default 0.2

% External matched disturbance
    matched_disurbance_flag=0;
    load_disturbance_flag=0;
% --------------- Load type-----------------------------------------------
    load_type="heavy load";
%     load_type="light load";
% --------------- Initial sway type---------------------------------------
    initial_sway_type="no initial sway";
%     initial_sway_type="30 degrees on the first angle";
%     initial_sway_type="15 degrees on all angles";
% --------------- Others--------------------------------------------------
SNR_value=inf;  %90
trolley_damping=0; %1000
unbalanced_factor=0.5; % Entre 0 et 1. 0 est équilibré % simulation is for 0.1
% =========================================================================

t_f=100; %100
h=50e-3; % Control sampling  50e-3;
max_step_size=1e-4; % Maximum simulation samping time step
delay_time=100e-3;
g=9.81;

number_of_cables=8;
cable_length=10;
last_piece_length=1;
number_of_pendulums=19;
rho_cable=3.56*number_of_cables;
cable_mass_total=cable_length*rho_cable;
cable_eact_piece=cable_mass_total/number_of_pendulums;

if load_type=="heavy load"
	hook_mass= 13600;
    payload_mass= 40000; 
elseif load_type=="light load"
    hook_mass= 20;
    payload_mass= 20;
end

cart_mass=10000;
total_mass=cable_mass_total+hook_mass+cart_mass+payload_mass;

if initial_sway_type=="no initial sway"
    first_link_sway=0;  %degree
    all_initial_sway=0;  %degree
elseif initial_sway_type=="30 degrees on the first angle"
    first_link_sway=30;  %degree
    all_initial_sway=0;  %degree
elseif initial_sway_type=="15 degrees on all angles"
    first_link_sway=0;  %degree
    all_initial_sway=15;  %degree
end

disturbance_period=20;
if matched_disurbance_flag==1 && load_disturbance_flag==1
    cart_disturbance_amp=cart_mass*g*0.2;
    load_disturbance_amp=payload_mass*g*0.02;
    dist_cond="dis. on cart-load";
elseif matched_disurbance_flag==1 && load_disturbance_flag==0
    cart_disturbance_amp=cart_mass*g*0.2;
    load_disturbance_amp=0;
    dist_cond="dis. on cart";
elseif matched_disurbance_flag==0 && load_disturbance_flag==1
    cart_disturbance_amp=0;
    load_disturbance_amp=payload_mass*g*0.02;
    dist_cond="dis. on load";
else
    cart_disturbance_amp=0;
    load_disturbance_amp=0;
    dist_cond="no dis.";
end

damping_coefficient=0.2*number_of_cables; %(N*M/(deg/s))
joint_stiffness=0.1*number_of_cables;   % N*M/deg
sat_const=100e3;   % Saturation constant
c_actuator=10; % actuator pole



t=0;
for j=1:t_f/h
    t=t+h;
    [~,~,a_d_full_x(j)]=trajectory(t,traj_number,sin_traj_w,sin_traj_A);
end

a_d_full_y=circshift(a_d_full_x,floor(1/h))/2;

for j=1:floor(1/h)
    a_d_full_y(j)=0;
end

%% linearized model for observation

% m=cart_mass;
% m1=hook_mass+cable_mass_total;
% m2=payload_mass;
% 
% L1=cable_length;
% L2=last_piece_length;
% 
% dx=trolley_damping;
% d1=trolley_damping;
% d2=trolley_damping;
% 
% 
% Ap=[m+m1+m2     ,    (m1+m2)*L1     ,    m2*L2;...
%   (m1+m2)*L1   ,    (m1+m2)*L1^2   ,    m2*L1*L2;...
%    m2*L2       ,    m2*L1*L2       ,    m2*L2^2];
% 
% Bp=[dx 0 0;0 d1 0;0 0 d2];
% 
% Cp=[0 0 0;...
%     0 (m1+m2)*g*L1 0;...
%     0  0  m2*g*L2];
% 
% 
% A=[zeros(3,3) eye(3) ; -inv(Ap)*Cp  -inv(Ap)*Bp];
% 
% B=zeros(6,1);B(4)=1/(m+m1+m2);
% 
% C=[1,0,0,0,0,0];
% 
% D=zeros(1,1);
% 
% obsm=obsv(A,C);
% 
% rank(obsm)

