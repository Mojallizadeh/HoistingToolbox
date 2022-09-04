function F = control_7_non_col_PD_reg_last_angle(xd, vd, x, v, theta_2, theta_dot_2,cont_param_7)

    % A regulation controller
    % N. Sun and Y. Fang, "New Energy Analytical Results for the Regulation of Underactuated Overhead Cranes: An
    % End-Effector Motion-Based Approach," in IEEE Transactions on Industrial Electronics, vol. 59, no. 12,
    % pp. 4723-4734, Dec. 2012, doi: 10.1109/TIE.2012.2183837.
    
 
    kp = cont_param_7(1);
    kd = cont_param_7(2);
    ka = cont_param_7(3);
    ex = (x - xd);
    ev = (v - vd);

    F = -kp * (ex - ka * sin(theta_2)) - kd * (ev - ka * theta_dot_2 * cos(theta_2));
    
end