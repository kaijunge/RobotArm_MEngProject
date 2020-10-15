% Combine terms into a single variable for simplicity
I_r2 = rod_mass * (rod_l/2)^2 + I_r;

% SS representation, ABCD matrix
A = [0             1        0          0;
     -k/I_m   -l/I_m    k/I_m      l/I_m;
     0             0        0          1;
     k/I_r2   l/I_r2  -k/I_r2    -l/I_r2];
    
B = [    0;
     1/I_m;
         0;
         0];
 
C = [0 0 1 0];
 
D = [0];
 
% Q, R cost funcitons
Q = [1 0 0 0;
     0 1 0 0;
     0 0 1 0;
     0 0 0 1];
 
R = [1];

% K derived by LQR
K = lqr(A, B, Q, R);
 
sys = ss((A - B*K), B, C, D);

% Find the premultiplier on the ref signal by looking at the final value
% of the system transfer function
[num,den] = ss2tf(A-B*K,B,C,D);

M = den(end)/num(end);


% Resonance frequency stuff
k = 0.1;
l = 0;
W_r     = sqrt(k*(I_r2 + I_m)/(I_m*I_r2));
disp(strcat("Resonance frequency for k=", num2str(k), " is ", num2str(W_r)))