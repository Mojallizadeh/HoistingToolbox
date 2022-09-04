clc;clear;close all;
Method="all"; % "all"; % "all" for all methods;  % 

model_select="rigid";  % "rigid" or  "flexible"


    % 1 unshaped - open-loop
    % 2 ZV - open-lopp
    % 3 ZVD - open-lopp
    % 4 PD collocated regulation
    % 5 Quasi-PID regulation noncollocated
    % 6 Noncollacated PD regulation - first angle
    % 7 Noncollacated PD regulation - last angle
    % 8 Collocated PD tracking
    % 9 ANDREA-NOVEL   
    % 10 SMC-single-first-explicit
    % 11 SMC-single-first-implicit
    % 12 SMC-single-last-explicit
    % 13 SMC-single-last-implicit
    % 14 SMC-double-explicit
    % 15 SMC-double-implicit
    % 16 PD energy (first)
    % 17 PD energy (last)    
    % 18 Coupling tracking (first)  
    % 19 Coupling tracking (last)     
    % 20 coupling_tracking_3d_first

if strcmp(Method,"all")
    for jj=1:19
        close all;clearvars -except traj_type traj_number load_type initial_sway_type jj model_select
        fprintf('Method %d ...', jj)
        parameters
        method_select=jj; 
        if model_select=="rigid"
            out=sim('Crane_rigid.slx');
        elseif model_select=="flexible"
            out=sim('Crane_flexible_beam.slx'); 
        end
        evaluation
        save(num2str(jj))
        fprintf(' OK! \n')
    end
else
        close all;clearvars -except traj_type traj_number load_type initial_sway_type jj Method model_select
        fprintf('Method %d ...', Method)
        parameters
        method_select=Method;           
        if model_select=="rigid"
            out=sim('Crane_rigid.slx');
        elseif model_select=="flexible"
            out=sim('Crane_flexible_beam.slx'); 
        end
        evaluation
        save(num2str(Method))
        fprintf(' OK! \n')
end    

fprintf('Finished! Evaluation is in progress ... \n \n')

compare_methods
