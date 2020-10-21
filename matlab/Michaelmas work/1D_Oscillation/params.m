% Set parameters for the SingleMass simulation

% Mass of the object
m = 1;

% Spring constant
k = 10;

% Dampbing
l = 0.1;


omega_n     = sqrt(k/m);
zeta        = l/(2*sqrt(k/m));
omega_d     = omega_n * sqrt(1-zeta^2);


% Spring initial offset
z_offset    = 1;