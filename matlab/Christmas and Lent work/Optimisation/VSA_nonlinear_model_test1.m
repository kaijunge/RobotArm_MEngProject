clc; clear; %close all;

%%
% Find curves

% Control points for bsplines (random)
p = [ 1  1;
      3  3;
      2  2;
      2  2];
  
  
% B-Splines
M = (1/6)*[-1  3 -3  1;
            3 -6  3  0;
           -3  0  3  0;
            1  4  1  0];
        
C = M*p;


syms x(t) k(t);
x,k = C(1)*t^3 +  C(2)*t^2 + C(3)*t + C(4);

%%
% solve ODE

q0 = 0;
qdot0 = 0;
m = 1;


syms u1(t) u2(t) q(t)
u1 = x;%sin(t);
u2 = k;

Dq = diff(q);
ode = m*diff(q,t,2)+ u2*q == u2*u1;
cond = [q(0) == q0,Dq(0) == qdot0];
tic;
qsol = dsolve(ode,cond);



%%
% integrate

F = double(int(qsol,[0 1]));
toc
%%
%Plotting... if needed...
T = 0:0.01:1;
solt = double( subs(qsol, t, T) );
figure
plot(T, solt);
title("NONLINEAR: Using symbolic math");