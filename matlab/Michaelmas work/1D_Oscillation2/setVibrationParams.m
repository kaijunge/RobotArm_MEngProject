function [m_out k_out c_out w_n zeta] = setVibrationParams(w_n_target,zeta_target,params_in,toChange)

params_out = [0 0 0];
for i = 1:3
    if toChange(i) ~= 1
        params_out(i) = params_in(i);
    end
end
disp(params_out);

% error if neither mass or stiffness specified
if toChange(1) == 1 && toChange(2) ==1
    disp("Need to specify at least one of mass or stiffness");
end

% mass given but not stiffness
if toChange(1) == 0 && toChange(2) ==1
    params_out(2) = w_n_target^2 * params_in(1);
end

% stiffness given but not mass
if toChange(1) == 1 && toChange(2) ==0
    params_out(1) = params_in(2) / (w_n_target^2);
end
% At this point both mass and stiffness should have been filled 

% damping not given
params_out(3) = 2*zeta_target*sqrt(params_out(1)*params_out(2));
    
% sanity check
w_n_check = sqrt(params_out(2)/params_out(1));
zeta_check = params_out(3)/(2*sqrt(params_out(2)*params_out(1)));

if w_n_check == w_n_target
    disp("w_n is equal to target");
else
    disp("w_n is NOT equal to target. Your output w_n is:");
    disp(w_n_check);
end
    
if zeta_check == zeta_target
    disp("zeta is equal to target");
else
    disp("zeta is NOT equal to target. Your output zeta is:");
    disp(zeta_check);
end
    

m_out = params_out(1);
k_out = params_out(2);
c_out = params_out(3);
w_n   = w_n_check;
zeta  = zeta_check;
end

