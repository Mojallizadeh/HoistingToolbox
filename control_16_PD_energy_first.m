function F = control_16_PD_energy_first(xd, vd, x, v, theta, theta_dot,cont_param_16)

% Zhang, S, He, X, Chen, Q, Feng, Y. Improved energy dissipation control of overhead cranes. Asian J Control. 2020; 22: 1729– 1735. 

    kp=cont_param_16(1);
    kd=cont_param_16(2);
    kq=cont_param_16(3);
    lambda=cont_param_16(4);
    zeta=cont_param_16(5);
    
    ex=x-xd;
    ev=v-vd;
    X=ex+lambda*sin(theta);   
    X_dot=ev+lambda*cos(theta)*theta_dot; 
    eps=x+lambda*sin(theta);
    
    F=-kd*X_dot-kp*tanh(X)-kq*X*((xd+zeta)^2-eps^2+X*eps)/((xd+zeta)^2-eps^2)^2;
    
end