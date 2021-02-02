p = [1 3 2 2]';

% B-Splines
M = (1/6)*[-1  3 -3  1;
            3 -6  3  0;
           -3  0  3  0;
            1  4  1  0];

% Hermite
% M =  [ 2 -2  1  1;
%       -3  3 -2 -1;
%        0  0  1  0;
%        1  0  0  0];

% Bezier
        
C = M*p;
syms f(t);

f = C(1)*t^3 +  C(2)*t^2 + C(3)*t + C(4);

tmin = 0;
tmax = 1;
ezplot(f,[tmin,tmax])