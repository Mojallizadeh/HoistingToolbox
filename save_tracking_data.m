% clc;clear;close all
% 
% load 1
% 
% if exist('tracking_data.mat','file')==2
%     load tracking_data
% end
% 
% if exist('save_counter','var')
%     save_counter=save_counter+1;
% else
%      save_counter=1;
% end
% 
% load 1 sin_traj_w
% 
% ws(save_counter)=sin_traj_w;
% 
% for jjj=1:19
%     load(num2str(jjj))
%     norm_2_e_payload_save(save_counter,jjj)=norm_2_e_payload;
%     norm_2_Payload_total_rot_save(save_counter,jjj)=norm_2_Payload_total_rot;
% 
% end
% 
% 
% save tracking_data

ws=[0.05 0.1 0.2 0.3 0.4 0.5];

close all

for kkkk=1:19
    plot(ws,norm_2_e_payload_save(:,kkkk),'--','LineWidth',2)
    hold on
end

grid on
xlabel('$\omega$ (rad/s)','Interpreter','latex','FontSize',18)
ylabel('$L_2(e_p)$','Interpreter','latex','FontSize',18)

legend('unshaped input','ZV','ZVD','Collocated PD regulation','Quasi-PID','Noncollocated PD regulation (first angle)'...
    ,'Noncollocated PD regulation (last angle)','Collocated PD tracking','PD-PD','Explicit single-pendulum SMC (first angle)'...
    ,'Implicit single-pendulum SMC (first angle)','Explicit single-pendulum SMC (last angle)','Implicit single-pendulum SMC (last angle)','Explicit double-pendulum SMC',...
    'Implicit double-pendulum SMC','PD energy (first angle)','PD energy (last angle)','Coupling tracking (first angle)','Coupling tracking (last angle)','FontSize',18)

 set(gca,'FontSize',14)


%  figure
% 
% 
% for kkkk=1:19
%     plot(ws,norm_2_Payload_total_rot_save(:,kkkk),'--','LineWidth',2)
%     hold on
% end
% 
% grid on
% xlabel('$\omega$ (rad/s)','Interpreter','latex','FontSize',18)
% ylabel('$L_2(\phi)$','Interpreter','latex','FontSize',18)
% 
% legend('unshaped input','ZV','ZVD','Collocated PD regulation','Quasi-PID','Noncollocated PD regulation (first angle)'...
%     ,'Noncollocated PD regulation (last angle)','Collocated PD tracking','PD-PD','Explicit single-pendulum SMC (first angle)'...
%     ,'Implicit single-pendulum SMC (first angle)','Explicit single-pendulum SMC (last angle)','Implicit single-pendulum SMC (last angle)','Explicit double-pendulum SMC',...
%     'Implicit double-pendulum SMC','PD energy (first angle)','PD energy (last angle)','Coupling tracking (first angle)','Coupling tracking (last angle)','FontSize',18)
% 
%  set(gca,'FontSize',14)
% 
