fprintf('===== Optimizing method 4 =====\n \n')
method=4;
fun=@(x) double_pendulum(x,method,0);
load parameters_file
nvars=2;
lb=[0;0];
ub=[];
MaxFunctionEvaluations=1000*nvars;
iguess=zeros(1,nvars);
% %================ PSO ================
fprintf('PSO ...\n \n')
options_pso = optimoptions('particleswarm','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
[cont_param_4_pso,fval_4_pso,exitflag_4_pso,output_4_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_4_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_4_fmincon,fval_4_fmincon,exitflag_4_fmincon,output_4_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_4_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_4_patternsearch,fval_4_patternsearch,exitflag_4_patternsearch,output_4_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_4_ga,fval_4_ga,exitflag_4_ga,output_4_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_4_surrogateopt,fval_4_surrogateopt,exitflag_4_surrogateopt,output_4_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_4_ga=inf;
fval_4_surrogateopt=inf;
output_4_ga=0;
output_4_surrogateopt=0;
%================ selecting the best ================
fval_4=min([fval_4_pso,fval_4_fmincon,fval_4_patternsearch,fval_4_ga,fval_4_surrogateopt]);
if fval_4_pso==fval_4
    cont_param_4=cont_param_4_pso;
    output_4=output_4_pso;
    fcount_4=output_4_pso.funccount;
elseif fval_4_fmincon==fval_4
    cont_param_4=cont_param_4_fmincon;
    output_4=output_4_fmincon;    
    fcount_4=output_4_fmincon.funcCount;    
elseif fval_4_patternsearch==fval_4
    cont_param_4=cont_param_4_patternsearch; 
    output_4=output_4_patternsearch;
    fcount_4=output_4_patternsearch.funccount;     
elseif fval_4_ga==fval_4
    cont_param_4=cont_param_4_ga; 
    output_4=output_4_ga;  
    fcount_4=output_4_ga.funccount;      
elseif fval_4_surrogateopt==fval_4
    cont_param_4=cont_param_4_surrogateopt;
    output_4=output_4_surrogateopt;   
    fcount_4=output_4_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters
