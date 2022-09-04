fprintf('===== Optimizing method 16 =====\n \n')
method=16;
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
[cont_param_16_pso,fval_16_pso,exitflag_16_pso,output_16_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_16_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_16_fmincon,fval_16_fmincon,exitflag_16_fmincon,output_16_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_16_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_16_patternsearch,fval_16_patternsearch,exitflag_16_patternsearch,output_16_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_16_ga,fval_16_ga,exitflag_16_ga,output_16_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_16_surrogateopt,fval_16_surrogateopt,exitflag_16_surrogateopt,output_16_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_16_ga=inf;
fval_16_surrogateopt=inf;
output_16_ga=0;
output_16_surrogateopt=0;
%================ selecting the best ================
fval_16=min([fval_16_pso,fval_16_fmincon,fval_16_patternsearch,fval_16_ga,fval_16_surrogateopt]);
if fval_16_pso==fval_16
    cont_param_16=cont_param_16_pso;
    output_16=output_16_pso;
    fcount_16=output_16_pso.funccount;
elseif fval_16_fmincon==fval_16
    cont_param_16=cont_param_16_fmincon;
    output_16=output_16_fmincon;    
    fcount_16=output_16_fmincon.funcCount;    
elseif fval_16_patternsearch==fval_16
    cont_param_16=cont_param_16_patternsearch; 
    output_16=output_16_patternsearch;
    fcount_16=output_16_patternsearch.funccount;     
elseif fval_16_ga==fval_16
    cont_param_16=cont_param_16_ga; 
    output_16=output_16_ga;  
    fcount_16=output_16_ga.funccount;      
elseif fval_16_surrogateopt==fval_16
    cont_param_16=cont_param_16_surrogateopt;
    output_16=output_16_surrogateopt;   
    fcount_16=output_16_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters
