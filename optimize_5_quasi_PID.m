fprintf('===== Optimizing method 5 =====\n \n')
method=5;
fun=@(x) double_pendulum(x,method,0);
load parameters_file
nvars=6;
lb=[0;0;0;0;0;0];
ub=[];
MaxFunctionEvaluations=1000*nvars;
iguess=zeros(1,nvars);
 %================ PSO ================
fprintf('PSO ...\n \n')
options_pso = optimoptions('particleswarm','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
[cont_param_5_pso,fval_5_pso,exitflag_5_pso,output_5_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_5_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_5_fmincon,fval_5_fmincon,exitflag_5_fmincon,output_5_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_5_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_5_patternsearch,fval_5_patternsearch,exitflag_5_patternsearch,output_5_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_5_ga,fval_5_ga,exitflag_5_ga,output_5_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_5_surrogateopt,fval_5_surrogateopt,exitflag_5_surrogateopt,output_5_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_5_ga=inf;
fval_5_surrogateopt=inf;
output_5_ga=0;
output_5_surrogateopt=0;
%================ selecting the best ================
fval_5=min([fval_5_pso,fval_5_fmincon,fval_5_patternsearch,fval_5_ga,fval_5_surrogateopt]);
if fval_5_pso==fval_5
    cont_param_5=cont_param_5_pso;
    output_5=output_5_pso;
    fcount_5=output_5_pso.funccount;
elseif fval_5_fmincon==fval_5
    cont_param_5=cont_param_5_fmincon;
    output_5=output_5_fmincon;    
    fcount_5=output_5_fmincon.funcCount;    
elseif fval_5_patternsearch==fval_5
    cont_param_5=cont_param_5_patternsearch; 
    output_5=output_5_patternsearch;
    fcount_5=output_5_patternsearch.funccount;     
elseif fval_5_ga==fval_5
    cont_param_5=cont_param_5_ga; 
    output_5=output_5_ga;  
    fcount_5=output_5_ga.funccount;      
elseif fval_5_surrogateopt==fval_5
    cont_param_5=cont_param_5_surrogateopt;
    output_5=output_5_surrogateopt;   
    fcount_5=output_5_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters

