fprintf('===== Optimizing method 11 =====\n \n')
method=11;
fun=@(x) double_pendulum(x,method,0);
load parameters_file
nvars=6;
lb=[0;0;0;0;0;0];
ub=[];
MaxFunctionEvaluations=1100*nvars;
iguess=zeros(1,nvars);
% %================ PSO ================
fprintf('PSO ...\n \n')
options_pso = optimoptions('particleswarm','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
[cont_param_11_pso,fval_11_pso,exitflag_11_pso,output_11_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_11_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_11_fmincon,fval_11_fmincon,exitflag_11_fmincon,output_11_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_11_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_11_patternsearch,fval_11_patternsearch,exitflag_11_patternsearch,output_11_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_11_ga,fval_11_ga,exitflag_11_ga,output_11_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_11_surrogateopt,fval_11_surrogateopt,exitflag_11_surrogateopt,output_11_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_11_ga=inf;
fval_11_surrogateopt=inf;
output_11_ga=0;
output_11_surrogateopt=0;
%================ selecting the best ================
fval_11=min([fval_11_pso,fval_11_fmincon,fval_11_patternsearch,fval_11_ga,fval_11_surrogateopt]);
if fval_11_pso==fval_11
    cont_param_11=cont_param_11_pso;
    output_11=output_11_pso;
    fcount_11=output_11_pso.funccount;
elseif fval_11_fmincon==fval_11
    cont_param_11=cont_param_11_fmincon;
    output_11=output_11_fmincon;    
    fcount_11=output_11_fmincon.funcCount;    
elseif fval_11_patternsearch==fval_11
    cont_param_11=cont_param_11_patternsearch; 
    output_11=output_11_patternsearch;
    fcount_11=output_11_patternsearch.funccount;     
elseif fval_11_ga==fval_11
    cont_param_11=cont_param_11_ga; 
    output_11=output_11_ga;  
    fcount_11=output_11_ga.funccount;      
elseif fval_11_surrogateopt==fval_11
    cont_param_11=cont_param_11_surrogateopt;
    output_11=output_11_surrogateopt;   
    fcount_11=output_11_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters
