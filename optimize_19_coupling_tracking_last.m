fprintf('===== Optimizing method 19 =====\n \n')
method=19;
fun=@(x) double_pendulum(x,method,0);
load parameters_file
nvars=3;
lb=[0;0;0];
ub=[];
MaxFunctionEvaluations=1100*nvars;
iguess=zeros(1,nvars);
% %================ PSO ================
fprintf('PSO ...\n \n')
options_pso = optimoptions('particleswarm','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
[cont_param_19_pso,fval_19_pso,exitflag_19_pso,output_19_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_19_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_19_fmincon,fval_19_fmincon,exitflag_19_fmincon,output_19_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_19_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_19_patternsearch,fval_19_patternsearch,exitflag_19_patternsearch,output_19_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_19_ga,fval_19_ga,exitflag_19_ga,output_19_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_19_surrogateopt,fval_19_surrogateopt,exitflag_19_surrogateopt,output_19_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_19_ga=inf;
fval_19_surrogateopt=inf;
output_19_ga=0;
output_19_surrogateopt=0;
%================ selecting the best ================
fval_19=min([fval_19_pso,fval_19_fmincon,fval_19_patternsearch,fval_19_ga,fval_19_surrogateopt]);
if fval_19_pso==fval_19
    cont_param_19=cont_param_19_pso;
    output_19=output_19_pso;
    fcount_19=output_19_pso.funccount;
elseif fval_19_fmincon==fval_19
    cont_param_19=cont_param_19_fmincon;
    output_19=output_19_fmincon;    
    fcount_19=output_19_fmincon.funcCount;    
elseif fval_19_patternsearch==fval_19
    cont_param_19=cont_param_19_patternsearch; 
    output_19=output_19_patternsearch;
    fcount_19=output_19_patternsearch.funccount;     
elseif fval_19_ga==fval_19
    cont_param_19=cont_param_19_ga; 
    output_19=output_19_ga;  
    fcount_19=output_19_ga.funccount;      
elseif fval_19_surrogateopt==fval_19
    cont_param_19=cont_param_19_surrogateopt;
    output_19=output_19_surrogateopt;   
    fcount_19=output_19_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters
