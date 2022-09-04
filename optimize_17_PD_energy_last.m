fprintf('===== Optimizing method 17 =====\n \n')
method=17;
fun=@(x) double_pendulum(x,method,0);
load parameters_file
nvars=5;
lb=[0;0;0;0;0];
ub=[];
MaxFunctionEvaluations=1100*nvars;
iguess=zeros(1,nvars);
% %================ PSO ================
fprintf('PSO ...\n \n')
options_pso = optimoptions('particleswarm','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
[cont_param_17_pso,fval_17_pso,exitflag_17_pso,output_17_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_17_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_17_fmincon,fval_17_fmincon,exitflag_17_fmincon,output_17_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_17_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_17_patternsearch,fval_17_patternsearch,exitflag_17_patternsearch,output_17_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_17_ga,fval_17_ga,exitflag_17_ga,output_17_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_17_surrogateopt,fval_17_surrogateopt,exitflag_17_surrogateopt,output_17_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_17_ga=inf;
fval_17_surrogateopt=inf;
output_17_ga=0;
output_17_surrogateopt=0;
%================ selecting the best ================
fval_17=min([fval_17_pso,fval_17_fmincon,fval_17_patternsearch,fval_17_ga,fval_17_surrogateopt]);
if fval_17_pso==fval_17
    cont_param_17=cont_param_17_pso;
    output_17=output_17_pso;
    fcount_17=output_17_pso.funccount;
elseif fval_17_fmincon==fval_17
    cont_param_17=cont_param_17_fmincon;
    output_17=output_17_fmincon;    
    fcount_17=output_17_fmincon.funcCount;    
elseif fval_17_patternsearch==fval_17
    cont_param_17=cont_param_17_patternsearch; 
    output_17=output_17_patternsearch;
    fcount_17=output_17_patternsearch.funccount;     
elseif fval_17_ga==fval_17
    cont_param_17=cont_param_17_ga; 
    output_17=output_17_ga;  
    fcount_17=output_17_ga.funccount;      
elseif fval_17_surrogateopt==fval_17
    cont_param_17=cont_param_17_surrogateopt;
    output_17=output_17_surrogateopt;   
    fcount_17=output_17_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters
