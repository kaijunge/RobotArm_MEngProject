% Combine terms into a single variable for simplicity
m = M_eq;
xe = 0;
u1e = 9;
u2e = xe;

% SS representation, ABCD matrix
A = [0 1; -1*u1e/m 0];
    
B = [0 0;0 u1e/m];
 
C = [1 1];
 
D = [0 0];
 
% Q, R cost funcitons
Q = [1 0;
     0 1];
 
R = [0.01 0;
     0 0.01];

% K derived by LQR
K = lqr(A, B, Q, R);
 
sys = ss((A - B*K), B, C, D);

% Find the premultiplier on the ref signal by looking at the final value
% of the system transfer function
%[num,den] = ss2tf(A-B*K,B,C,D);

%M = den(end)/num(end);

K