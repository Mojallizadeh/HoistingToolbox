norm_2_e_payload_x=norm(out.Payload_x-out.xd,2);
norm_2_e_payload_y=norm(out.Payload_y-out.yd,2);

norm_2_e_payload=norm_2_e_payload_x+norm_2_e_payload_y;

norm_2_e_trolley_x=norm(out.Trolley_position_x-out.xd,2);
norm_2_e_trolley_y=norm(out.Trolley_position_y-out.yd,2);

norm_2_e_trolley=norm_2_e_trolley_x+norm_2_e_trolley_y;

norm_F_2_x=norm(out.F_x_after_sat,2);
norm_F_2_y=norm(out.F_y_after_sat,2);

norm_F_2=norm_F_2_x+norm_F_2_y;

norm_F_inf_x=norm(out.F_x_after_sat,inf);
norm_F_inf_y=norm(out.F_y_after_sat,inf);

norm_F_inf=norm_F_inf_x+norm_F_inf_y;

norm_2_Payload_total_rot=norm(out.Payload_total_rot,2)
norm_inf_Payload_total_rot=norm(out.Payload_total_rot,inf)


fprintf('Coupling tracking (3D) & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)

