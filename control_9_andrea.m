function F = control_9_andrea(x,xd,v,vd,theta,theta_dot,cont_param_9)


% d’Andréa-Novel, Brigitte, Iván Moyano, and Lionel Rosier. "Finite-time stabilization of an overhead crane with a flexible cable."
% Mathematics of Control, Signals, and Systems 31.2 (2019): 1-19.

    a1=cont_param_9(1);
    a2=cont_param_9(2);
    a3=cont_param_9(3);
    a4=(cont_param_9(2)*cont_param_9(3)-cont_param_9(3)*(cont_param_9(2)/2+sqrt(cont_param_9(2)^2+4*cont_param_9(1))/2))/(cont_param_9(1));

    
    ex=x-xd;
    ev=v-vd;

	F=  -a1*ex - a2* ev -  a3* theta - a4 * theta_dot;

    
end