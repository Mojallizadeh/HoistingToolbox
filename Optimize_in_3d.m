clear; close all; clc
parameters
load parameters_file
%================ general parameters ================
MaxStallTime=1*60*60;
MaxTime=5*60*60;
Aeq=[];
beq=[];
A=[];
b=[];
nonlcon=[];


fun=@(x) Crane_rigid_3d_single_20_coupling_tracking_fun(x);

options_pso = optimoptions('particleswarm','Display', 'iter','MaxTime',MaxTime);

[cont_param_20_pso,fval_20_pso,exitflag_20_pso,output_20_pso] = particleswarm(fun,5,[0 0 0 0 0],[],options_pso)
