% Defined Params
motor_r         = 0.05; %m
motor_l         = 0.03; %m
motor_rho       = 1000; %m
rod_w           = 0.1;  %m
rod_l           = 0.3;  %m
rod_rho         = 1000; %kg/m^3
k               = 1;   %N/m/rad
l               = 0.1;  %N/m/s/rad

% Derived params
motor_mass    = (motor_r^2)*pi*motor_l*motor_rho;
rod_mass  = (rod_w^2)*rod_l*rod_rho;
I_m     = motor_mass * (motor_r^2)/2;
I_r     = rod_mass * (1/12)*(rod_w^2 + rod_l^2);