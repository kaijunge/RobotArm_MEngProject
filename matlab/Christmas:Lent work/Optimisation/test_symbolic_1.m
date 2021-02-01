clc; clear; close all;
syms u(t) y(t)
u = 0;%sin(t);

y0 = 1;
ydot0 = 0;
m = 1;
c = -2;
k = 1;

Dy = diff(y);
ode = m*diff(y,t,2)+ c*diff(y,t) + k*y == u;
cond = [y(0) == y0,Dy(0) == ydot0];
ysol = dsolve(ode,cond)

tmin = 0;
tmax = 20;
ezplot(ysol,[tmin,tmax])