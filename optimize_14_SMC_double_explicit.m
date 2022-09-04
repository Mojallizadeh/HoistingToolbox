fprintf('===== Optimizing method 14 =====\n \n')
method=14;
fun=@(x) double_pendulum(x,method,0);
load parameters_file
nvars=5;
lb=[0;0;0;0;0];
ub=[];
MaxFunctionEvaluations=1200*nvars;
iguess=zeros(1,nvars);
% %================ PSO ================
fprintf('PSO ...\n \n')
options_pso = optimoptions('particleswarm','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
[cont_param_14_pso,fval_14_pso,exitflag_14_pso,output_14_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_14_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_14_fmincon,fval_14_fmincon,exitflag_14_fmincon,output_14_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_14_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_14_patternsearch,fval_14_patternsearch,exitflag_14_patternsearch,output_14_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_14_ga,fval_14_ga,exitflag_14_ga,output_14_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_14_surrogateopt,fval_14_surrogateopt,exitflag_14_surrogateopt,output_14_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_14_ga=inf;
fval_14_surrogateopt=inf;
output_14_ga=0;
output_14_surrogateopt=0;
%================ selecting the best ================
fval_14=min([fval_14_pso,fval_14_fmincon,fval_14_patternsearch,fval_14_ga,fval_14_surrogateopt]);
if fval_14_pso==fval_14
    cont_param_14=cont_param_14_pso;
    output_14=output_14_pso;
    fcount_14=output_14_pso.funccount;
elseif fval_14_fmincon==fval_14
    cont_param_14=cont_param_14_fmincon;
    output_14=output_14_fmincon;    
    fcount_14=output_14_fmincon.funcCount;    
elseif fval_14_patternsearch==fval_14
    cont_param_14=cont_param_14_patternsearch; 
    output_14=output_14_patternsearch;
    fcount_14=output_14_patternsearch.funccount;     
elseif fval_14_ga==fval_14
    cont_param_14=cont_param_14_ga; 
    output_14=output_14_ga;  
    fcount_14=output_14_ga.funccount;      
elseif fval_14_surrogateopt==fval_14
    cont_param_14=cont_param_14_surrogateopt;
    output_14=output_14_surrogateopt;   
    fcount_14=output_14_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters
