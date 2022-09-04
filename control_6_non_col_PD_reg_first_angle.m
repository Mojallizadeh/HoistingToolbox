function F = control_6_non_col_PD_reg_first_angle(xd, vd, x, v, theta_1, theta_dot_1,cont_param_6)

    % A regulation controller
    % N. Sun and Y. Fang, "New Energy Analytical Results for the Regulation of Underactuated Overhead Cranes: An
    % End-Effector Motion-Based Approach," in IEEE Transactions on Industrial Electronics, vol. 59, no. 12,
    % pp. 4723-4734, Dec. 2012, doi: 10.1109/TIE.2012.2183837.
    
 
    
    kp = cont_param_6(1);
    kd = cont_param_6(2);
    ka = cont_param_6(3);
    ex = (x - xd);
    ev = (v - vd);

    F = -kp * (ex - ka * sin(theta_1)) - kd * (ev - ka * theta_dot_1 * cos(theta_1));
    
end