function F = control_8_collocated_PD_tracking(x,xd,v,vd,ad,trolley_mass,load_mass,hook_mass,cable_mass_total,cont_param_8)


% Ning Sun, Yongchun Fang,
% Nonlinear tracking control of underactuated cranes with load transferring and lowering: Theory and experimentation,
% Automatica,
% Volume 50, Issue 9,
% 2014,
% Pages 2350-2357,

    kp=cont_param_8(1);
    kd=cont_param_8(2);
    LO=cont_param_8(3);
    Z=cont_param_8(4);
    phi=cont_param_8(5);
    M=trolley_mass;
    m=load_mass+hook_mass+cable_mass_total;
    e=x-xd;
    edot=v-vd;
    F=-kp*e-(2*LO*(Z^2))*e/(Z^2-(e^2))-kd*edot+(m+M)*ad-phi*sign(edot);

end