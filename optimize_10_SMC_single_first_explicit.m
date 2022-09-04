fprintf('===== Optimizing method 10 =====\n \n')
method=10;
fun=@(x) double_pendulum(x,method,0);
load parameters_file
nvars=6;
lb=[0;0;0;0;0;0];
ub=[];
MaxFunctionEvaluations=1000*nvars;
iguess=zeros(1,nvars);
% %================ PSO ================
fprintf('PSO ...\n \n')
options_pso = optimoptions('particleswarm','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
[cont_param_10_pso,fval_10_pso,exitflag_10_pso,output_10_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_10_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_10_fmincon,fval_10_fmincon,exitflag_10_fmincon,output_10_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_10_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_10_patternsearch,fval_10_patternsearch,exitflag_10_patternsearch,output_10_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_10_ga,fval_10_ga,exitflag_10_ga,output_10_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_10_surrogateopt,fval_10_surrogateopt,exitflag_10_surrogateopt,output_10_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_10_ga=inf;
fval_10_surrogateopt=inf;
output_10_ga=0;
output_10_surrogateopt=0;
%================ selecting the best ================
fval_10=min([fval_10_pso,fval_10_fmincon,fval_10_patternsearch,fval_10_ga,fval_10_surrogateopt]);
if fval_10_pso==fval_10
    cont_param_10=cont_param_10_pso;
    output_10=output_10_pso;
    fcount_10=output_10_pso.funccount;
elseif fval_10_fmincon==fval_10
    cont_param_10=cont_param_10_fmincon;
    output_10=output_10_fmincon;    
    fcount_10=output_10_fmincon.funcCount;    
elseif fval_10_patternsearch==fval_10
    cont_param_10=cont_param_10_patternsearch; 
    output_10=output_10_patternsearch;
    fcount_10=output_10_patternsearch.funccount;     
elseif fval_10_ga==fval_10
    cont_param_10=cont_param_10_ga; 
    output_10=output_10_ga;  
    fcount_10=output_10_ga.funccount;      
elseif fval_10_surrogateopt==fval_10
    cont_param_10=cont_param_10_surrogateopt;
    output_10=output_10_surrogateopt;   
    fcount_10=output_10_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters
