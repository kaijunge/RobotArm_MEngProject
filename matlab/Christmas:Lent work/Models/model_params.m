m_motor = 0.05;     % Mass of the motor
l_motor = 0.05;     % Length of the motor. 

l_output = 0.3;     % Length of output shaft
w_output = 0.02;    % width of the output shaft
t_output = 0.01;    % Thickness of the output shaft

r = 0.14;           % Distace from CoM to hinge
eff_inertia = 1;    % Effective inertia = I_G + mr^2
m_output = eff_inertia/((l_output^2+w_output^2)/12 + r^2); % Mass required for this effecive inertia

% Inertia of the rod
Ixx = (l_output^2+t_output^2)/12;   
Iyy = (t_output^2+w_output^2)/12;
Izz = (l_output^2+w_output^2)/12;


% Equivalent mass
M_eq = eff_inertia;