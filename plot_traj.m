clc;clear;close all


dt=1e-3;


t=0:dt:100;



for j=1:length(t)

    [x_d(j),v_d(j),a_d(j)] = trajectory(t(j),1);

end



subplot(3,2,1)
    plot(t,x_d,'color','k','LineWidth',2)
    grid on
    legend("reference position ($m$)",'Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
    title("Regulation")
subplot(3,2,3)
    plot(t,v_d,'color','k','LineWidth',2)
    grid on
    legend("reference velocity  ($m/s$)",'Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
subplot(3,2,5)
    plot(t,a_d,'color','k','LineWidth',2)
    grid on
    legend("reference acceleration  ($m/s^2$)",'Interpreter','latex','FontSize',18)
    xlabel('Time (s)','Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)

    %-------------------


for j=1:length(t)

    [x_d(j),v_d(j),a_d(j)] = trajectory(t(j),2);

end



subplot(3,2,2)
    plot(t,x_d,'color','k','LineWidth',2)
    grid on
    legend("reference position ($m$)",'Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
        title("Tracking")
subplot(3,2,4)
    plot(t,v_d,'color','k','LineWidth',2)
    grid on
    legend("reference velocity  ($m/s$)",'Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
subplot(3,2,6)
    plot(t,a_d,'color','k','LineWidth',2)
    grid on
    legend("reference acceleration  ($m/s^2$)",'Interpreter','latex','FontSize',18)
    xlabel('Time (s)','Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)

    

