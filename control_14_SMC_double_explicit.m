function F = control_14_SMC_double_explicit(xd, vd, x, v, theta_1,theta_2, theta_dot_1,theta_dot_2,cont_param_14,h,cart_mass,payload_mass,cable_mass_total,hook_mass,cable_length,last_piece_length)

% Qian and J. Yi. Hierarchical sliding mode control for under-actuated
% cranes.Heidelberg, Ber: Springer,2016.

    lambda=cont_param_14(1);
    alpha=cont_param_14(2);
    beta=cont_param_14(3);
    K=cont_param_14(4);
    c_filter=100;
    x4_dot = LF(theta_dot_1,c_filter,h);
    x6_dot = LF(theta_dot_2,c_filter,h);
    
    s=(v-vd)+lambda*(x-xd)+alpha*theta_1+beta*theta_2;
    
	ueq=-(payload_mass+cable_mass_total+hook_mass)*cable_length*cos(theta_1)*x4_dot-(cable_mass_total+hook_mass)*last_piece_length*cos(theta_2)*x6_dot...
    +(payload_mass+cable_mass_total+hook_mass)*cable_length*sin(theta_1)*theta_dot_1^2+(cable_mass_total+hook_mass)*last_piece_length*sin(theta_2)*theta_dot_2^2 ...
    -(cart_mass+payload_mass+cable_mass_total+hook_mass)*(lambda*(v-vd)+alpha*theta_dot_1+beta*theta_dot_2);

    F=ueq-K*sign(s);

end