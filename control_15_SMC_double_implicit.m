function F = control_15_SMC_double_implicit(xd, vd, x, v, theta_1,theta_2, theta_dot_1,theta_dot_2,cont_param_15,h,cart_mass,payload_mass,cable_mass_total,hook_mass,cable_length,last_piece_length)

% Qian and J. Yi. Hierarchical sliding mode control for under-actuated
% cranes.Heidelberg, Ber: Springer,2016. 
% Implicit discretization is done by Rasool


    lambda=cont_param_15(1);
    alpha=cont_param_15(2);
    beta=cont_param_15(3);
    K=cont_param_15(4);
    c_filter=cont_param_15(5);
    x4_dot = LF(theta_dot_1,c_filter,h);
    x6_dot = LF(theta_dot_2,c_filter,h);
    
    s=(v-vd)+lambda*(x-xd)+alpha*theta_1+beta*theta_2;
    
	ueq=-(payload_mass+cable_mass_total+hook_mass)*cable_length*cos(theta_1)*x4_dot-(cable_mass_total+hook_mass)*last_piece_length*cos(theta_2)*x6_dot...
    +(payload_mass+cable_mass_total+hook_mass)*cable_length*sin(theta_1)*theta_dot_1^2+(cable_mass_total+hook_mass)*last_piece_length*sin(theta_2)*theta_dot_2^2 ...
    -(cart_mass+payload_mass+cable_mass_total+hook_mass)*(lambda*(v-vd)+alpha*theta_dot_1+beta*theta_dot_2);


    bk=-s;
    a=(h*K)/(payload_mass+cable_mass_total+hook_mass+cart_mass);
 
    if bk<-a
        sk1=s-a;
        usw=-(K*sk1)/(payload_mass+cable_mass_total+hook_mass+cart_mass);
    elseif bk>a
        sk1=s+a;
        usw=(K*sk1)/(payload_mass+cable_mass_total+hook_mass+cart_mass);
    else
        usw=bk/h;
    end
    
    F=ueq+usw;

end