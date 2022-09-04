fprintf('===== Optimizing method 15 =====\n \n')
method=15;
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
[cont_param_15_pso,fval_15_pso,exitflag_15_pso,output_15_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_15_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_15_fmincon,fval_15_fmincon,exitflag_15_fmincon,output_15_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_15_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_15_patternsearch,fval_15_patternsearch,exitflag_15_patternsearch,output_15_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_15_ga,fval_15_ga,exitflag_15_ga,output_15_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_15_surrogateopt,fval_15_surrogateopt,exitflag_15_surrogateopt,output_15_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_15_ga=inf;
fval_15_surrogateopt=inf;
output_15_ga=0;
output_15_surrogateopt=0;
%================ selecting the best ================
fval_15=min([fval_15_pso,fval_15_fmincon,fval_15_patternsearch,fval_15_ga,fval_15_surrogateopt]);
if fval_15_pso==fval_15
    cont_param_15=cont_param_15_pso;
    output_15=output_15_pso;
    fcount_15=output_15_pso.funccount;
elseif fval_15_fmincon==fval_15
    cont_param_15=cont_param_15_fmincon;
    output_15=output_15_fmincon;    
    fcount_15=output_15_fmincon.funcCount;    
elseif fval_15_patternsearch==fval_15
    cont_param_15=cont_param_15_patternsearch; 
    output_15=output_15_patternsearch;
    fcount_15=output_15_patternsearch.funccount;     
elseif fval_15_ga==fval_15
    cont_param_15=cont_param_15_ga; 
    output_15=output_15_ga;  
    fcount_15=output_15_ga.funccount;      
elseif fval_15_surrogateopt==fval_15
    cont_param_15=cont_param_15_surrogateopt;
    output_15=output_15_surrogateopt;   
    fcount_15=output_15_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters
