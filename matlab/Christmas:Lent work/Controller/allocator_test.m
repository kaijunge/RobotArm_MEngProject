function [u1, u2, ud_new] = allocator_test(ud,x, u1_old, u2_old, Ts, w)


u1_lim_low = 20;
u1_lim_high = 10000;

u2_lim = pi;

u2_x_lim = 0.7; %40 deg apart

% Not sure what is a suitable value for this is yet. 
u1_vel_lim = 10000;
u2_vel_lim = 10000;

if isnan(u1_old)
    u1_old = 100;
end

if isnan(u2_old)
    u2_old = 0;
end


% Now we find upper and lower bound of u1 and u2
lb = [max([u1_old - Ts*u1_vel_lim, u1_lim_low]), ...
        max([u2_old - Ts*u2_vel_lim, -1*u2_lim, x-u2_x_lim]), -inf, -inf];
    
ub = [min([u1_old + Ts*u1_vel_lim, u1_lim_high]), ...
        min([u2_old + Ts*u2_vel_lim, u2_lim, x+u2_x_lim]), inf, inf];    

lb = [-inf, -inf, -inf, -inf];
ub = [inf, inf, inf, inf];


x0 = [u1_old,u2_old,x,ud];
A = [];
b = [];
Aeq = [0,0,1,0;
       0,0,0,1];
beq = [x;ud];
nonlcon = @NL_Cond;

options = optimoptions('fmincon','StepTolerance',1e-4,...
'SpecifyObjectiveGradient',false,'Algorithm','sqp');

fun = @(x)w(1)*x(1)^2+w(2)*x(2)^2 + ...
    w(3)*(x(1)-u1_old)^2 + w(4)*(x(2)-u2_old)^2 +...
    w(5)*((x(1)-u1_old)*x(2))^2;

u = fmincon(fun,x0,A,b,Aeq,beq,lb,ub,nonlcon,options);

u1 = u(1);
u2 = u(2);

ud_new = u1*(u2-x);

end