function F = control_3_ZVD(total_mass, a_d_full, h, t_f,t)
% Hong, Keum-Shik, and Umer Hameed Shah. Dynamics and control of industrial cranes. Singapore: Springer, 2019.

    FF= total_mass.* a_d_full;

    %g = 9.8;
    zeta = 0;
    % wn = math.sqrt(g / total_length);
    wn = 1.1;
    wd = wn * sqrt(1. - zeta ^ 2);
    K = exp(-zeta * pi / sqrt(1. - zeta ^ 2));

    A1 = 1 / ((1 + K) ^ 2);
    A2 = 2 * K / ((1 + K) ^ 2);
    A3 = K ^ 2 / ((1 + K) ^ 2);
    t1 = 0;
    t2 = pi / wd;
    t3 = 2 * pi / wd;

    t1_index = floor(t1 / h)+1;
    t2_index = floor(t2 / h)+1;
    t3_index = floor(t3 / h)+1;

    N = floor(t_f / h);

    conv1 = zeros(N,1);
    conv1(t1_index) = A1;
    conv1(t2_index) = A2;
    conv1(t3_index) = A3;

    F1 = conv(FF, conv1);

    F=F1(floor(t/h)+1);

end