clc;clear;close all;

w=[0.05 0.1 0.2 0.3 0.4 0.5];

L2_20=[33.37 66.87 123.25 196.39 262.84 329.10];



plot(w,L2_20,'-','LineWidth',2)
grid on
xlabel('$\omega$ (rad/s)','Interpreter','latex','FontSize',18)
ylabel('$\tilde{L}_2(e_p)$','Interpreter','latex','FontSize',18)

legend('Coupling tracking (3D)','FontSize',18)

 set(gca,'FontSize',14)
