fprintf('===== Optimizing method 8 =====\n \n')
method=8;
fun=@(x) double_pendulum(x,method,0);
load parameters_file
nvars=5;
lb=[0;0;0;0;0];
ub=[];
MaxFunctionEvaluations=1000*nvars;
iguess=zeros(1,nvars);
 %================ PSO ================
fprintf('PSO ...\n \n')
options_pso = optimoptions('particleswarm','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
[cont_param_8_pso,fval_8_pso,exitflag_8_pso,output_8_pso] = particleswarm(fun,nvars,lb,ub,options_pso)
save_parameters
% %================ fmincon ================
fprintf('fmincon ...\n \n')
options_8_fmincon = optimoptions('fmincon','Display', 'iter','MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_8_fmincon,fval_8_fmincon,exitflag_8_fmincon,output_8_fmincon] = fmincon(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_8_fmincon) 
save_parameters
% %================ patternsearch ================
fprintf('patternsearch ...\n \n')
options_patternsearch = optimoptions('patternsearch','Display', 'iter','MaxTime',MaxTime,'MaxFunctionEvaluations',MaxFunctionEvaluations);
[cont_param_8_patternsearch,fval_8_patternsearch,exitflag_8_patternsearch,output_8_patternsearch] = patternsearch(fun,iguess,A,b,Aeq,beq,lb,ub,nonlcon,options_patternsearch)
save_parameters
% %================ GA ================
% fprintf('GA ...\n \n')
% options_ga = optimoptions('ga','Display', 'iter','MaxStallTime',MaxStallTime,'MaxTime',MaxTime);
% [cont_param_8_ga,fval_8_ga,exitflag_8_ga,output_8_ga] = ga(fun,nvars,A,b,Aeq,beq,lb,ub,nonlcon,options_ga)
% save_parameters
% %================ surrogateopt ================
% fprintf('surrogateopt ...\n \n')
% options_surrogateopt = optimoptions('surrogateopt','Display', 'iter','MaxTime',MaxTime);
% [cont_param_8_surrogateopt,fval_8_surrogateopt,exitflag_8_surrogateopt,output_8_surrogateopt] = surrogateopt(fun,lb,ub,options_surrogateopt)
% save_parameters
fval_8_ga=inf;
fval_8_surrogateopt=inf;
output_8_ga=0;
output_8_surrogateopt=0;
%================ selecting the best ================
fval_8=min([fval_8_pso,fval_8_fmincon,fval_8_patternsearch,fval_8_ga,fval_8_surrogateopt]);
if fval_8_pso==fval_8
    cont_param_8=cont_param_8_pso;
    output_8=output_8_pso;
    fcount_8=output_8_pso.funccount;
elseif fval_8_fmincon==fval_8
    cont_param_8=cont_param_8_fmincon;
    output_8=output_8_fmincon;    
    fcount_8=output_8_fmincon.funcCount;    
elseif fval_8_patternsearch==fval_8
    cont_param_8=cont_param_8_patternsearch; 
    output_8=output_8_patternsearch;
    fcount_8=output_8_patternsearch.funccount;     
elseif fval_8_ga==fval_8
    cont_param_8=cont_param_8_ga; 
    output_8=output_8_ga;  
    fcount_8=output_8_ga.funccount;      
elseif fval_8_surrogateopt==fval_8
    cont_param_8=cont_param_8_surrogateopt;
    output_8=output_8_surrogateopt;   
    fcount_8=output_8_surrogateopt.funccount;     
end
    
%================ finishing ================

save_parameters

