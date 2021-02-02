clc; clear; %close all;

% Try to concatenate many splines

%% 
% Desired trajectory 
syms qd_symb(t)
qd_symb = heaviside(t-0.5);

%%
% Find curves
tic;
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


%%
% solve ODE

q0 = [0;0];
t0 = 0;
tf = 1;

f = @(t,q) [q(2); [t^3 t^2 t 1]*C(:,2)*([t^3 t^2 t 1]*C(:,1)-q(1))];
[ts,qs] = ode45(f,[t0,tf],q0);

%%
% Cost function integration
qd = double( subs(qd_symb, t, ts) );    % desired q
qr = qs(:,1);                           % Real q

cost = (qd - qr)'*(qd - qr);
toc
%%
%Plotting... if needed...
figure
hold on;
plot(ts, qr)
plot(ts, qd)
title("using ODE45");
legend("Real curve", "desired curve");

%%
for i = 1:length(ts)-1
    disp(ts(i+1) - ts(i))
end