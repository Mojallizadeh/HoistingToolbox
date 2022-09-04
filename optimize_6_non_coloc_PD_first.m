fprintf('===== Optimizing method 6 =====\n \n')
method=6;
fun=@(x) double_pendulum(x,method,0);
load parameters_file
nvars=3;
lb=[0;0;0];
ub=[];
MaxFunctionEvaluations=1000*nvars;
iguess=zeros(1,nvars);
 %================ PSO ================
fprintf('PSO ...\n \n')
options_pso = optimoptions('particleswarm','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
[cont_param_6_pso,fval_6_pso,exitflag_6_pso,output_6_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_6_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_6_fmincon,fval_6_fmincon,exitflag_6_fmincon,output_6_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_6_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_6_patternsearch,fval_6_patternsearch,exitflag_6_patternsearch,output_6_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_6_ga,fval_6_ga,exitflag_6_ga,output_6_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_6_surrogateopt,fval_6_surrogateopt,exitflag_6_surrogateopt,output_6_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_6_ga=inf;
fval_6_surrogateopt=inf;
output_6_ga=0;
output_6_surrogateopt=0;
%================ selecting the best ================
fval_6=min([fval_6_pso,fval_6_fmincon,fval_6_patternsearch,fval_6_ga,fval_6_surrogateopt]);
if fval_6_pso==fval_6
    cont_param_6=cont_param_6_pso;
    output_6=output_6_pso;
    fcount_6=output_6_pso.funccount;
elseif fval_6_fmincon==fval_6
    cont_param_6=cont_param_6_fmincon;
    output_6=output_6_fmincon;    
    fcount_6=output_6_fmincon.funcCount;    
elseif fval_6_patternsearch==fval_6
    cont_param_6=cont_param_6_patternsearch; 
    output_6=output_6_patternsearch;
    fcount_6=output_6_patternsearch.funccount;     
elseif fval_6_ga==fval_6
    cont_param_6=cont_param_6_ga; 
    output_6=output_6_ga;  
    fcount_6=output_6_ga.funccount;      
elseif fval_6_surrogateopt==fval_6
    cont_param_6=cont_param_6_surrogateopt;
    output_6=output_6_surrogateopt;   
    fcount_6=output_6_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters

