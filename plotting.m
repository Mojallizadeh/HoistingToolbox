close all;

if plot_type=="trajectories"

    subplot(3,2,1)
    plot(out.time,out.x_payload,'color','b','LineWidth',2)
    hold on
    plot(out.time,out.x_cart,'color','r','LineWidth',2)
    plot(out.time,out.x_trajectory,'--','color','k','LineWidth',2)
    grid on
    legend("Payload position","Cart position","Reference position",'FontSize',18)
    xlabel('Time (s)','Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
    ylim=get(gca,'ylim');
    xlim=get(gca,'xlim');
    text(xlim(end),ylim(end),'(A)','FontSize',24)  


    subplot(3,2,2)
    plot(out.time,out.v_payload,'color','b','LineWidth',2)
    hold on
    plot(out.time,out.v_cart,'color','r','LineWidth',2)
    plot(out.time,out.v_trajectory,'--','color','k','LineWidth',2)
    grid on
    legend("Payload velocity","Cart velocity","Reference velocity",'FontSize',18)
    xlabel('Time (s)','Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
    ylim=get(gca,'ylim');
    xlim=get(gca,'xlim');
    text(xlim(end),ylim(end),'(B)','FontSize',24)  

    subplot(3,2,3)
    plot(out.time,out.angle_1,'color','b','LineWidth',2)
    hold on
    plot(out.time,out.angle_2,'LineWidth',1)
    plot(out.time,out.angle_3,'LineWidth',1)
    plot(out.time,out.angle_4,'LineWidth',1)
    plot(out.time,out.angle_5,'LineWidth',1)
    plot(out.time,out.angle_6,'LineWidth',1)
    plot(out.time,out.angle_7,'LineWidth',1)
    plot(out.time,out.angle_8,'LineWidth',1)
    plot(out.time,out.angle_9,'LineWidth',1)
    plot(out.time,out.angle_10,'LineWidth',1)
    plot(out.time,out.angle_11,'LineWidth',1)
    plot(out.time,out.angle_12,'LineWidth',1)
    plot(out.time,out.angle_13,'LineWidth',1)
    plot(out.time,out.angle_14,'LineWidth',1)
    plot(out.time,out.angle_15,'LineWidth',1)
    plot(out.time,out.angle_16,'LineWidth',1)
    plot(out.time,out.angle_17,'LineWidth',1)
    plot(out.time,out.angle_18,'LineWidth',1)
    plot(out.time,out.angle_19,'LineWidth',1)
    plot(out.time,out.angle_20,'color','r','LineWidth',2)
    grid on
    legend("angle 1","angle 2","angle 3","angle 4","angle 5","angle 6","angle 7","angle 8","angle 9","angle 10","angle 11","angle 12","angle 13","angle 14","angle 15","angle 16","angle 17","angle 18","angle 19","angle 20",'FontSize',14)
    xlabel('Time (s)','Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
    ylim=get(gca,'ylim');
    xlim=get(gca,'xlim');
    text(xlim(end),ylim(end),'(C)','FontSize',24) 


    subplot(3,2,4)
    plot(out.time,out.Force_trolley,'color','b','LineWidth',2,'LineStyle','-')
    hold on
    plot(out.time,out.F_trolley_filtered,'color','k','LineWidth',2,'LineStyle','-')
    grid on
    legend("Control signal","Force after actuator",'FontSize',18)
    xlabel('Time (s)','Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
    ylim=get(gca,'ylim');
    xlim=get(gca,'xlim');
    text(xlim(end),ylim(end),'(D)','FontSize',24)  

    subplot(3,2,5)
    plot(out.time,out.x_payload-out.x_trajectory,'color','b','LineWidth',2)
    grid on
    legend("Payload position error",'FontSize',18)
    xlabel('Time (s)','Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
    ylim=get(gca,'ylim');
    xlim=get(gca,'xlim');
    text(xlim(end),ylim(end),'(E)','FontSize',24)  

    subplot(3,2,6)
    plot(out.time,out.v_payload-out.v_trajectory,'color','b','LineWidth',2)
    grid on
    legend("Payload velocity error",'FontSize',18)
    xlabel('Time (s)','Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
    ylim=get(gca,'ylim');
    xlim=get(gca,'xlim');
    text(xlim(end),ylim(end),'(F)','FontSize',24)  


    y=gcf;
    y.WindowState = 'maximized';
    
	pause(3)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

elseif plot_type=="energies"


    subplot(2,2,1)
    plot(out.time,out.KE,'color','b','LineWidth',2)
    grid on
    legend("Kinetic energy",'FontSize',18)
    xlabel('Time (s)','Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
    ylim=get(gca,'ylim');
    xlim=get(gca,'xlim');
    text(xlim(end),ylim(end),'(A)','FontSize',24)  


    subplot(2,2,2)
    plot(out.time,out.PE,'color','b','LineWidth',2)
    grid on
    legend("Potential energy",'FontSize',18)
    xlabel('Time (s)','Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
    ylim=get(gca,'ylim');
    xlim=get(gca,'xlim');
    text(xlim(end),ylim(end),'(B)','FontSize',24)  

    subplot(2,2,3)
    plot(out.time,out.supplied,'color','b','LineWidth',2)
    grid on
    legend("Supplied energy",'FontSize',14)
    xlabel('Time (s)','Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
    ylim=get(gca,'ylim');
    xlim=get(gca,'xlim');
    text(xlim(end),ylim(end),'(C)','FontSize',24) 


    subplot(2,2,4)
    plot(out.time,out.KE+out.PE-out.supplied,'color','b','LineWidth',2)
    grid on
    legend("Potential energy + Kinetic energy - supplied energy",'FontSize',18)
    xlabel('Time (s)','Interpreter','latex','FontSize',18)
    grid on
    set(gca,'FontSize',14)
    ylim=get(gca,'ylim');
    xlim=get(gca,'xlim');
    text(xlim(end),ylim(end),'(D)','FontSize',24)  

    y=gcf;
    y.WindowState = 'maximized';

    pause(3)
    
end
