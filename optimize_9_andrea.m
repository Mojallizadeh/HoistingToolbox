fprintf('===== Optimizing method 9 =====\n \n')
method=9;
fun=@(x) double_pendulum(x,method,0);
load parameters_file
nvars=3;
lb=[0;0;0];
ub=[];
MaxFunctionEvaluations=1000*nvars;
iguess=ones(1,nvars);
 %================ PSO ================
fprintf('PSO ...\n \n')
options_pso = optimoptions('particleswarm','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
[cont_param_9_pso,fval_9_pso,exitflag_9_pso,output_9_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_9_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_9_fmincon,fval_9_fmincon,exitflag_9_fmincon,output_9_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_9_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_9_patternsearch,fval_9_patternsearch,exitflag_9_patternsearch,output_9_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_9_ga,fval_9_ga,exitflag_9_ga,output_9_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_9_surrogateopt,fval_9_surrogateopt,exitflag_9_surrogateopt,output_9_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_9_ga=inf;
fval_9_surrogateopt=inf;
output_9_ga=0;
output_9_surrogateopt=0;
%================ selecting the best ================
fval_9=min([fval_9_pso,fval_9_fmincon,fval_9_patternsearch,fval_9_ga,fval_9_surrogateopt]);
if fval_9_pso==fval_9
    cont_param_9=cont_param_9_pso;
    output_9=output_9_pso;
    fcount_9=output_9_pso.funccount;
elseif fval_9_fmincon==fval_9
    cont_param_9=cont_param_9_fmincon;
    output_9=output_9_fmincon;    
    fcount_9=output_9_fmincon.funcCount;    
elseif fval_9_patternsearch==fval_9
    cont_param_9=cont_param_9_patternsearch; 
    output_9=output_9_patternsearch;
    fcount_9=output_9_patternsearch.funccount;     
elseif fval_9_ga==fval_9
    cont_param_9=cont_param_9_ga; 
    output_9=output_9_ga;  
    fcount_9=output_9_ga.funccount;      
elseif fval_9_surrogateopt==fval_9
    cont_param_9=cont_param_9_surrogateopt;
    output_9=output_9_surrogateopt;   
    fcount_9=output_9_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters
