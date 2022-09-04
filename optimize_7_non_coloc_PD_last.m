fprintf('===== Optimizing method 7 =====\n \n')
method=7;
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
[cont_param_7_pso,fval_7_pso,exitflag_7_pso,output_7_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_7_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_7_fmincon,fval_7_fmincon,exitflag_7_fmincon,output_7_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_7_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_7_patternsearch,fval_7_patternsearch,exitflag_7_patternsearch,output_7_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_7_ga,fval_7_ga,exitflag_7_ga,output_7_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_7_surrogateopt,fval_7_surrogateopt,exitflag_7_surrogateopt,output_7_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_7_ga=inf;
fval_7_surrogateopt=inf;
output_7_ga=0;
output_7_surrogateopt=0;
%================ selecting the best ================
fval_7=min([fval_7_pso,fval_7_fmincon,fval_7_patternsearch,fval_7_ga,fval_7_surrogateopt]);
if fval_7_pso==fval_7
    cont_param_7=cont_param_7_pso;
    output_7=output_7_pso;
    fcount_7=output_7_pso.funccount;
elseif fval_7_fmincon==fval_7
    cont_param_7=cont_param_7_fmincon;
    output_7=output_7_fmincon;    
    fcount_7=output_7_fmincon.funcCount;    
elseif fval_7_patternsearch==fval_7
    cont_param_7=cont_param_7_patternsearch; 
    output_7=output_7_patternsearch;
    fcount_7=output_7_patternsearch.funccount;     
elseif fval_7_ga==fval_7
    cont_param_7=cont_param_7_ga; 
    output_7=output_7_ga;  
    fcount_7=output_7_ga.funccount;      
elseif fval_7_surrogateopt==fval_7
    cont_param_7=cont_param_7_surrogateopt;
    output_7=output_7_surrogateopt;   
    fcount_7=output_7_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters

