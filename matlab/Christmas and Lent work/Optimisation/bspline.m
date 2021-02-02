function y = bspline(t,t_scale,cp)

% % B-Spline matrix
M = (1/6)*[-1  3 -3  1;
            3 -6  3  0;
           -3  0  3  0;
            1  4  1  0];

% Find the coefficients for each spline
C = M*cp;
C = C';

t = t/t_scale;

size(C)
size(t)
y = t.^3*C(1) +  t.^2*C(2) + t*C(3) + C(4);

