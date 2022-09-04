function [J] = Crane_rigid_3d_single_20_coupling_tracking_fun(cont_param_20)




set_param('Crane_rigid_3d_single_20_coupling_tracking/Controllers/controllers/cont_param_20','Value',mat2str(cont_param_20))


out=sim('Crane_rigid_3d_single_20_coupling_tracking');

Fx=out.F_x_after_sat;
Fy=out.F_y_after_sat;


% norm_F_2_x=norm(out.F_x_after_sat,2);
% norm_F_2_y=norm(out.F_y_after_sat,2);
% norm_F_2=norm_F_2_x+norm_F_2_y;
 
epx=out.Payload_x-out.xd;
epy=out.Payload_y-out.yd;

% 
% norm_2_e_payload_x=norm(out.Payload_x-out.xd,2);
% norm_2_e_payload_y=norm(out.Payload_y-out.yd,2);
ep=epx+epy;


varc=0;

for k=2:2000
    varc=abs(Fx(k)-Fx(k-1))+varc;
    varc=abs(Fy(k)-Fy(k-1))+varc;
end


ind1=300:2000;
ind2=600:2000;
ind3=200:2000;

J=norm(ep,2)+600*norm(ep(ind3),inf)+60*norm(ep(ind1),2)+300*norm(ep(ind2),2)+5e-2*varc; % For piecewise



end