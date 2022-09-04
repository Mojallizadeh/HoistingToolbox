fprintf('===== Optimizing method 13 =====\n \n')
method=13;
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
[cont_param_13_pso,fval_13_pso,exitflag_13_pso,output_13_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_13_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_13_fmincon,fval_13_fmincon,exitflag_13_fmincon,output_13_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_13_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_13_patternsearch,fval_13_patternsearch,exitflag_13_patternsearch,output_13_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_13_ga,fval_13_ga,exitflag_13_ga,output_13_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_13_surrogateopt,fval_13_surrogateopt,exitflag_13_surrogateopt,output_13_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_13_ga=inf;
fval_13_surrogateopt=inf;
output_13_ga=0;
output_13_surrogateopt=0;
%================ selecting the best ================
fval_13=min([fval_13_pso,fval_13_fmincon,fval_13_patternsearch,fval_13_ga,fval_13_surrogateopt]);
if fval_13_pso==fval_13
    cont_param_13=cont_param_13_pso;
    output_13=output_13_pso;
    fcount_13=output_13_pso.funccount;
elseif fval_13_fmincon==fval_13
    cont_param_13=cont_param_13_fmincon;
    output_13=output_13_fmincon;    
    fcount_13=output_13_fmincon.funcCount;    
elseif fval_13_patternsearch==fval_13
    cont_param_13=cont_param_13_patternsearch; 
    output_13=output_13_patternsearch;
    fcount_13=output_13_patternsearch.funccount;     
elseif fval_13_ga==fval_13
    cont_param_13=cont_param_13_ga; 
    output_13=output_13_ga;  
    fcount_13=output_13_ga.funccount;      
elseif fval_13_surrogateopt==fval_13
    cont_param_13=cont_param_13_surrogateopt;
    output_13=output_13_surrogateopt;   
    fcount_13=output_13_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters
