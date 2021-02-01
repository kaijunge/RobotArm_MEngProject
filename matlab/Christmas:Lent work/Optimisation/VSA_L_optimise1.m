syms yd(t)
yd = heaviside(t);

cp = [1 3 2 2 4];     % Control points
T = 1;              % Final time
k = 1;              % Stiffness

% disp("Starting function evaluation");
% [cost,yr] = VSA_L_1(cp,yd,T,k);
% disp("Done function evaluation");


fun = @VSA_L_1_simple;
n_cp = 7;
min_cp = -10;
max_cp = 10;
x0 = zeros(1,n_cp);
lb = min_cp*ones(1,n_cp);
ub = max_cp*ones(1,n_cp);
A = [];
b = [];
Aeq = [];
beq = [];
x = patternsearch(fun,x0,A,b,Aeq,beq,lb,ub)

% a = 4; b = 2.1; c = 4; % Assign parameter values
% x0 = [0.5,0.5];
% f = @(x)parameterfun(x,a,b,c);