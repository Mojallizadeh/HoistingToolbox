function [F] = control_5_quasi_PID(x, v, theta1_dot, theta2_dot, xd, vd,h,cont_param_5)
    
%     Designed for regulation
%     N. Sun, T. Yang, Y. Fang, Y. Wu and H. Chen, "Transportation Control of Double-Pendulum Cranes With a Nonlinear
%     Quasi-PID Scheme: Design and Experiments," in IEEE Transactions on Systems, Man, and Cybernetics: Systems, vol. 49,
%     no. 7, pp. 1408-1418, July 2019, doi: 10.1109/TSMC.2018.2871627.

    persistent memory
    if isempty(memory)
        memory=0;
    end
    kp = cont_param_5(1);
    kd = cont_param_5(2);
    ki = cont_param_5(3);
    k_phi1 = cont_param_5(4);
    k_phi2 = cont_param_5(5);
    lambda1 = cont_param_5(6);

    ex = x - xd;
    ev = v - vd;

    memory = memory + h*tanh(ex);

    F = -kp * tanh(ex) - kd * tanh(ev) - k_phi1 * (tanh(theta1_dot)) ^ 2 * tanh(ev) - k_phi2 * (...
        tanh(theta2_dot)) ^ 2 * tanh(ev) - ki * tanh(lambda1 ^ 2 * ex + lambda1 * memory);
    
end

