function F = control_19_coupling_tracking_last(vd, v,ad, theta, theta_dot,h,cont_param_19,total_mass)

% Zhang, Menghua, et al. "An enhanced coupling nonlinear tracking controller for underactuated 3D overhead crane systems." 
% Asian Journal of Control 20.5 (2018): 1839-1854. 

   persistent int_zeta_x
    if isempty(int_zeta_x)
        int_zeta_x=0;
    end

    kp=cont_param_19(1);
    kd=cont_param_19(2);
    lambda=cont_param_19(3);
    
    ev=(v-vd);
    
    zeta_x=ev+lambda*sin(theta)*(-1);
    
    int_zeta_x=h*zeta_x+int_zeta_x;
    
    F=-kd*zeta_x-kp*int_zeta_x+(total_mass)*ad+lambda*(total_mass)*cos(theta)*theta_dot;
    
end