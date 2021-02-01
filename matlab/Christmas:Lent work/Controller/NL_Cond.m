function [c,ceq] = NL_Cond(x)
c = (x(1)*(x(2)-x(3))-x(4))^2 - 0.1;
ceq = [];
end