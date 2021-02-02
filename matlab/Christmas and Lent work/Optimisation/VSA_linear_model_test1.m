clc; clear; close all;

%%
% Find curves

% Control points for bsplines (random)
p = [1 3 2 2]';

% B-Splines
M = (1/6)*[-1  3 -3  1;
            3 -6  3  0;
           -3  0  3  0;
            1  4  1  0];
        
C = M*p;
syms f(t);
f = C(1)*t^3 +  C(2)*t^2 + C(3)*t + C(4);

%%
% solve ODE

q0 = 0;
qdot0 = 0;
m = 1;
k = 1;


syms u1(t) q(t)
u1 = f;%sin(t);

Dq = diff(q);
ode = m*diff(q,t,2)+ k*q == k*u1;
cond = [q(0) == q0,Dq(0) == qdot0];
qsol = dsolve(ode,cond);
cost_fun = (1-qsol)^2;

%%
% integrate
cost = double(int(cost_fun, [0 1]));

%%
%Plotting... if needed...
T = 0:0.01:1;
solt = double( subs(qsol, t, T) );
figure
plot(T, solt);
title("LINEAR: Using symbolic math");