function [J] = Crane_rigid_3d_single_20_coupling_tracking(cont_param_20)




set_param('Crane_rigid_3d_single_20_coupling_tracking/Controllers/controllers/cont_param_20','Value',mat2str(cont_param_20))


out=sim('Crane_rigid_3d_single_20_coupling_tracking');



norm_F_2_x=norm(out.F_x_after_sat,2);
norm_F_2_y=norm(out.F_y_after_sat,2);
norm_F_2=norm_F_2_x+norm_F_2_y;
 
norm_2_e_payload_x=norm(out.Payload_x-out.xd,2);
norm_2_e_payload_y=norm(out.Payload_y-out.yd,2);
norm_2_e_payload=norm_2_e_payload_x+norm_2_e_payload_y;

J=norm_F_2+100000*norm_2_e_payload;


end