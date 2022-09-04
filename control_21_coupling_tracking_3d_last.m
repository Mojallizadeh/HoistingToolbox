function [F_x,F_y] = control_21_coupling_tracking_3d_last(vd_x,vd_y, v_x,v_y,ad_x,ad_y, theta_x, theta_y, theta_dot_x,theta_dot_y,h,cont_param_20,total_mass)

% Zhang, Menghua, et al. "An enhanced coupling nonlinear tracking controller for underactuated 3D overhead crane systems." 
% Asian Journal of Control 20.5 (2018): 1839-1854. 

    persistent int_zeta_x int_zeta_y
    if isempty(int_zeta_x)
        int_zeta_x=0;
    end

    if isempty(int_zeta_y)
        int_zeta_y=0;
    end

    kpx=cont_param_20(1);
    kdx=cont_param_20(2);
    lambda=cont_param_20(3);
    kpy=cont_param_20(4);
    kdy=cont_param_20(5);
    
    ev_x=(v_x-vd_x);
    ev_y=(v_y-vd_y);
    
    zeta_x=ev_x+lambda*sin(theta_x)*(-cos(theta_y));
    zeta_y=ev_y+lambda*(-theta_y);
    
    int_zeta_x=h*zeta_x+int_zeta_x;
    int_zeta_y=h*zeta_y+int_zeta_y;
    
    F_x=-kdx*zeta_x-kpx*int_zeta_x+(total_mass)*ad_x+lambda*(total_mass)*cos(theta_x)*cos(theta_y)*theta_dot_x-lambda*(total_mass)*sin(theta_x)*sin(theta_y)*theta_dot_y;
    F_y=-kdy*zeta_y-kpy*int_zeta_y+(total_mass)*ad_y+lambda*(total_mass)*(theta_dot_y);
    
end