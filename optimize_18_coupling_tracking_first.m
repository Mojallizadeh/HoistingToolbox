fprintf('===== Optimizing method 18 =====\n \n')
method=18;
fun=@(x) double_pendulum(x,method,0);
load parameters_file
nvars=3;
lb=[0;0;0;];
ub=[];
MaxFunctionEvaluations=1100*nvars;
iguess=zeros(1,nvars);
% %================ PSO ================
fprintf('PSO ...\n \n')
options_pso = optimoptions('particleswarm','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
[cont_param_18_pso,fval_18_pso,exitflag_18_pso,output_18_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_18_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_18_fmincon,fval_18_fmincon,exitflag_18_fmincon,output_18_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_18_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_18_patternsearch,fval_18_patternsearch,exitflag_18_patternsearch,output_18_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_18_ga,fval_18_ga,exitflag_18_ga,output_18_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_18_surrogateopt,fval_18_surrogateopt,exitflag_18_surrogateopt,output_18_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_18_ga=inf;
fval_18_surrogateopt=inf;
output_18_ga=0;
output_18_surrogateopt=0;
%================ selecting the best ================
fval_18=min([fval_18_pso,fval_18_fmincon,fval_18_patternsearch,fval_18_ga,fval_18_surrogateopt]);
if fval_18_pso==fval_18
    cont_param_18=cont_param_18_pso;
    output_18=output_18_pso;
    fcount_18=output_18_pso.funccount;
elseif fval_18_fmincon==fval_18
    cont_param_18=cont_param_18_fmincon;
    output_18=output_18_fmincon;    
    fcount_18=output_18_fmincon.funcCount;    
elseif fval_18_patternsearch==fval_18
    cont_param_18=cont_param_18_patternsearch; 
    output_18=output_18_patternsearch;
    fcount_18=output_18_patternsearch.funccount;     
elseif fval_18_ga==fval_18
    cont_param_18=cont_param_18_ga; 
    output_18=output_18_ga;  
    fcount_18=output_18_ga.funccount;      
elseif fval_18_surrogateopt==fval_18
    cont_param_18=cont_param_18_surrogateopt;
    output_18=output_18_surrogateopt;   
    fcount_18=output_18_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters
