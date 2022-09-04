function F = control_11_SMC_single_first_implicit(xd, vd, x, v, theta, theta_dot,cont_param_11,h,cart_mass,payload_mass,cable_mass_total,hook_mass,cable_length,last_piece_length)

% Qian and J. Yi. Hierarchical sliding mode control for under-actuated
% cranes.Heidelberg, Ber: Springer,2016.

    c1=cont_param_11(1);
    c2=cont_param_11(2);
    c3=cont_param_11(3);
    c4=cont_param_11(4);
    kapa=cont_param_11(5);
    eta=cont_param_11(6);



    g=9.81;
    
%     eps1=1e-12;
%     eps2=1e-12;
    
    if cart_mass+(payload_mass+cable_mass_total+hook_mass)*sin(theta_dot)^2==0
        eps2=1e-12;
    else 
        eps2=0;
    end  
    
    f1=(cart_mass*(cable_length+last_piece_length)*theta^2*sin(theta_dot)+(payload_mass+cable_mass_total+hook_mass)*g*sin(theta_dot)*cos(theta_dot))/(cart_mass+(payload_mass+cable_mass_total+hook_mass)*sin(theta_dot)^2+eps2);
    b1=1/(cart_mass+(payload_mass+cable_mass_total+hook_mass)*sin(theta_dot)^2+eps2);
    f2=((cart_mass+(payload_mass+cable_mass_total+hook_mass))*g*sin(theta_dot)+(payload_mass+cable_mass_total+hook_mass)*(cable_length+last_piece_length)*theta^2*sin(theta_dot)*cos(theta))/((cart_mass+(payload_mass+cable_mass_total+hook_mass)*sin(theta_dot)^2)*(cable_length+last_piece_length)+eps2);
    b2=(cos(theta_dot))/((cart_mass+(payload_mass+cable_mass_total+hook_mass)*sin(theta_dot)^2)*(cable_length+last_piece_length)+eps2);
    
    if c2*b1+c4*b2==0
        eps1=1e-6;
    else 
        eps1=0;
    end
    
    s=c1*(x-xd)+c2*(v-vd)+c3*theta_dot+c4*theta;
    
    ueq=-(c1*(v-vd)+c3*theta+c2*f1+c4*f2)/(c2*b1+c4*b2+eps1);
    
    bk=-s/(1+h*kapa);
    a=(h*eta)/(1+h*kapa);
 
    if bk<-a
        sk1=-a-bk;
        usw=-(kapa*sk1+eta)/(c2*b1+c4*b2+eps1);
    elseif bk>a
        sk1=a-bk;
        usw=-(kapa*sk1-eta)/(c2*b1+c4*b2+eps1);
    else
        zeta=-bk*(1+h*kapa)/(h*eta);
        usw=-(eta*zeta)/(c2*b1+c4*b2+eps1);
    end
    
    F=ueq+usw;
    
end