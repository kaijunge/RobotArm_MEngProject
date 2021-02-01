% SS representation, ABCD matrix
A = [0        1         0           0;
     -k/m1   -c/m1    k/m1       c/m1;
     0        0         0           1;
     k/m1    c/m1     -k/m1     -c/m1];
    
B = [    0;
       1/m1;
         0;
         0];
 
C = [0 0 1 0];
 
D = [0];
 
% Q, R cost funcitons
Q = [1 0 0 0;
     0 1 0 0;
     0 0 10 0;
     0 0 0 1];
 
R = [1];

% K derived by LQR
K = lqr(A, B, Q, R);
 
sys = ss((A - B*K), B, C, D);

% Find the premultiplier on the ref signal by looking at the final value
% of the system transfer function
[num,den] = ss2tf(A-B*K,B,C,D);

M = den(end)/num(end);
