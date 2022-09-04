clc;clear;close all;

% Comparison table

load 1

fprintf('\\subsubsection{Comparing methods}\n\n')

fprintf('\\begin{table}[H]\n')
fprintf('\\centering\n')
fprintf('\\caption{Comparing the methods (reference trajectory: %s, %s, %s, damping coefficient=%.1f NM/(deg/s), joint stiffness=%.1f NM/deg,  cart mass=%.2f, SNR=%.2f, cart damping=%.2f, %s).}\n' ,traj_type,load_type,initial_sway_type,damping_coefficient,joint_stiffness,cart_mass,SNR_value,trolley_damping,dist_cond)
fprintf('\\begin{tabular}{ |l|c|c|c|c|c|c| }\n')
fprintf('\\hline\n')
fprintf('Method & $L_2(e_p)$ & $L_2(e_c)$ & $L_2(F)$ & $L_\\infty(F)$ & $L_2(\\phi)$ & $L_\\infty(\\phi)$ \\\\ \\hline \n')
load 1
fprintf('Unshaped input & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 2
fprintf('ZV & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 3
fprintf('ZVD & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 4
fprintf('Collocated PD & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 5
fprintf('Quasi-PID & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 6
fprintf('Non.CO.PD.Reg.1 & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 7
fprintf('Non.CO.PD.Reg.n & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 8
fprintf('Col.PD.Track & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 9
fprintf('PD-PD & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 10
fprintf('SMC-single-first (explicit)  & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 11
fprintf('SMC-single-first (implicit)  & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 12
fprintf('SMC-single-last (explicit)  & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 13
fprintf('SMC-single-last (implicit)  & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 14
fprintf('SMC-double (explicit)  & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 15
fprintf('SMC-double (implicit)  & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 16
fprintf('PD energy (first)  & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 17
fprintf('PD energy (last)  & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 18
fprintf('Coupling tracking (first)  & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
load 19
fprintf('Coupling tracking (last)  & %.2f & %.2f & %.2e & %.2e & %.2f & %.2f \\\\ \n',norm_2_e_payload,norm_2_e_trolley,norm_F_2,norm_F_inf,norm_2_Payload_total_rot,norm_inf_Payload_total_rot)
fprintf('\\hline\n')
fprintf('\\end{tabular}\n')
fprintf('\\label{T_comparison_3d_%s_%s_%s_damp_%.1f_stiff_%.1f_cart_m_%.2f_SNR%.2fTD%.2f_%s}\n',traj_type,load_type,initial_sway_type,damping_coefficient,joint_stiffness,cart_mass,SNR_value,trolley_damping,dist_cond)
fprintf('\\end{table}\n')



