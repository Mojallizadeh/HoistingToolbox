function F = control_12_SMC_single_last_explicit(xd, vd, x, v, theta_2, theta_dot_2,cont_param_12,cart_mass,payload_mass,cable_mass_total,hook_mass,cable_length,last_piece_length)

% Qian and J. Yi. Hierarchical sliding mode control for under-actuated
% cranes.Heidelberg, Ber: Springer,2016.

    c1=cont_param_12(1);
    c2=cont_param_12(2);
    c3=cont_param_12(3);
    c4=cont_param_12(4);
    kapa=cont_param_12(5);
    eta=cont_param_12(6);
    g=9.81;
    
%     eps1=1e-12;
%     eps2=1e-12;
    
    if cart_mass+(payload_mass+cable_mass_total+hook_mass)*sin(theta_dot_2)^2==0
        eps2=1e-12;
    else 
        eps2=0;
    end  
    
    f1=(cart_mass*(cable_length+last_piece_length)*theta_2^2*sin(theta_dot_2)+(payload_mass+cable_mass_total+hook_mass)*g*sin(theta_dot_2)*cos(theta_dot_2))/(cart_mass+(payload_mass+cable_mass_total+hook_mass)*sin(theta_dot_2)^2+eps2);
    b1=1/(cart_mass+(payload_mass+cable_mass_total+hook_mass)*sin(theta_dot_2)^2+eps2);
    f2=((cart_mass+(payload_mass+cable_mass_total+hook_mass))*g*sin(theta_dot_2)+(payload_mass+cable_mass_total+hook_mass)*(cable_length+last_piece_length)*theta_2^2*sin(theta_dot_2)*cos(theta_2))/((cart_mass+(payload_mass+cable_mass_total+hook_mass)*sin(theta_dot_2)^2)*(cable_length+last_piece_length)+eps2);
    b2=(cos(theta_dot_2))/((cart_mass+(payload_mass+cable_mass_total+hook_mass)*sin(theta_dot_2)^2)*(cable_length+last_piece_length)+eps2);
    
    if c2*b1+c4*b2==0
        eps1=1e-6;
    else 
        eps1=0;
    end
    
    s=c1*(x-xd)+c2*(v-vd)+c3*theta_dot_2+c4*theta_2;
    
    ueq=-(c1*(v-vd)+c3*theta_2+c2*f1+c4*f2)/(c2*b1+c4*b2+eps1);
    usw=-(kapa*s+eta*sign(s))/(c2*b1+c4*b2+eps1);
    
    F=ueq+usw;
    
end