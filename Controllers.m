function F = Controllers(x,xd,v,vd,theta_1,theta_2,theta1_dot,theta2_dot,trolley_mass,hook_mass,total_mass,a_d,a_d_full,h,t_f,t,cont_param_4,cont_param_5,cont_param_6,cont_param_7,cont_param_8,cont_param_9,cont_param_10,cont_param_11,cont_param_12,cont_param_13,cont_param_14,cont_param_15,cont_param_16,cont_param_17,cont_param_18,cont_param_19,cont_select,cart_mass,payload_mass,cable_mass_total,cable_length,last_piece_length)

if cont_select==1

    F = control_1_time_optimal(total_mass,a_d);
    
elseif cont_select==2

    F = control_2_zero_vibration(total_mass, a_d_full, h, t_f,t);

elseif cont_select==3
    
    F = control_3_ZVD(total_mass, a_d_full, h, t_f,t);

elseif cont_select==4
    
    F = control_4_PD_col_reg(x,xd,v,vd,cont_param_4);

elseif cont_select==5
    
    F = control_5_quasi_PID(x, v, theta1_dot, theta2_dot, xd, vd,h,cont_param_5);
    
elseif cont_select==6
    
    F = control_6_non_col_PD_reg_first_angle(xd, vd, x, v, theta_1, theta1_dot,cont_param_6);

elseif cont_select==7
    
    F = control_7_non_col_PD_reg_last_angle(xd, vd, x, v, theta_2, theta2_dot,cont_param_7);

elseif cont_select==8
    
    F = control_8_collocated_PD_tracking(x,xd,v,vd,a_d,trolley_mass,payload_mass,hook_mass,cable_mass_total,cont_param_8);
    
elseif cont_select==9
    
    F = control_9_andrea(x,xd,v,vd,theta_1,theta1_dot,cont_param_9);
    
elseif cont_select==10
    
    F = control_10_SMC_single_first_explicit(xd, vd, x, v, theta_1, theta1_dot,cont_param_10,cart_mass,payload_mass,cable_mass_total,hook_mass,cable_length,last_piece_length);   
    
elseif cont_select==11
   
    F = control_11_SMC_single_first_implicit(xd, vd, x, v, theta_1, theta1_dot,cont_param_11,h,cart_mass,payload_mass,cable_mass_total,hook_mass,cable_length,last_piece_length);

elseif cont_select==12
   
    F = control_12_SMC_single_last_explicit(xd, vd, x, v, theta_2, theta2_dot,cont_param_12,cart_mass,payload_mass,cable_mass_total,hook_mass,cable_length,last_piece_length);   

 elseif cont_select==13
   
    F = control_13_SMC_single_last_implicit(xd, vd, x, v, theta_2, theta2_dot,cont_param_13,h,cart_mass,payload_mass,cable_mass_total,hook_mass,cable_length,last_piece_length);

 elseif cont_select==14
   
    F = control_14_SMC_double_explicit(xd, vd, x, v, theta_1,theta_2, theta1_dot,theta2_dot,cont_param_14,h,cart_mass,payload_mass,cable_mass_total,hook_mass,cable_length,last_piece_length);

elseif cont_select==15
   
    F = control_15_SMC_double_implicit(xd, vd, x, v, theta_1,theta_2, theta1_dot,theta2_dot,cont_param_15,h,cart_mass,payload_mass,cable_mass_total,hook_mass,cable_length,last_piece_length);
    
elseif cont_select==16
   
    F = control_16_PD_energy_first(xd, vd, x, v, theta_1, theta1_dot,cont_param_16);
    
elseif cont_select==17
   
    F = control_17_PD_energy_last(xd, vd, x, v, theta_2, theta2_dot,cont_param_17);    
    
elseif cont_select==18
   
    F = control_18_coupling_tracking_first(vd, v,a_d, theta_1, theta1_dot,h,cont_param_18,total_mass);        
    
elseif cont_select==19
   
    F = control_19_coupling_tracking_last(vd, v,a_d, theta_2, theta2_dot,h,cont_param_19,total_mass);       
else

    F=0;

end

