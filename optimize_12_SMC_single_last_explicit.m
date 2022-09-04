fprintf('===== Optimizing method 12 =====\n \n')
method=12;
fun=@(x) double_pendulum(x,method,0);
load parameters_file
nvars=6;
lb=[0;0;0;0;0;0];
ub=[];
MaxFunctionEvaluations=1200*nvars;
iguess=zeros(1,nvars);
% %================ PSO ================
fprintf('PSO ...\n \n')
options_pso = optimoptions('particleswarm','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
[cont_param_12_pso,fval_12_pso,exitflag_12_pso,output_12_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_12_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_12_fmincon,fval_12_fmincon,exitflag_12_fmincon,output_12_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_12_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_12_patternsearch,fval_12_patternsearch,exitflag_12_patternsearch,output_12_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_12_ga,fval_12_ga,exitflag_12_ga,output_12_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_12_surrogateopt,fval_12_surrogateopt,exitflag_12_surrogateopt,output_12_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_12_ga=inf;
fval_12_surrogateopt=inf;
output_12_ga=0;
output_12_surrogateopt=0;
%================ selecting the best ================
fval_12=min([fval_12_pso,fval_12_fmincon,fval_12_patternsearch,fval_12_ga,fval_12_surrogateopt]);
if fval_12_pso==fval_12
    cont_param_12=cont_param_12_pso;
    output_12=output_12_pso;
    fcount_12=output_12_pso.funccount;
elseif fval_12_fmincon==fval_12
    cont_param_12=cont_param_12_fmincon;
    output_12=output_12_fmincon;    
    fcount_12=output_12_fmincon.funcCount;    
elseif fval_12_patternsearch==fval_12
    cont_param_12=cont_param_12_patternsearch; 
    output_12=output_12_patternsearch;
    fcount_12=output_12_patternsearch.funccount;     
elseif fval_12_ga==fval_12
    cont_param_12=cont_param_12_ga; 
    output_12=output_12_ga;  
    fcount_12=output_12_ga.funccount;      
elseif fval_12_surrogateopt==fval_12
    cont_param_12=cont_param_12_surrogateopt;
    output_12=output_12_surrogateopt;   
    fcount_12=output_12_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters
