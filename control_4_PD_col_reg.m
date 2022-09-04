function F = control_4_PD_col_reg(x,xd,v,vd,cont_param_4)

    kp=cont_param_4(1);
    kd=cont_param_4(2);

    F=-kp*(x-xd)-kd*(v-vd);  

end

