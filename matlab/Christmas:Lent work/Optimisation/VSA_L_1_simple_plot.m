function cost = VSA_L_1_simple(cp)
% Lienar model with only the input motor as the input. 
% cost = value of the cost function
% cp = contrl points
% yd_symb = desired trajectory of q as a symbolic math function
% T = total amount of time
% k = stiffness


syms yd_symb(t);
yd_symb = heaviside(t);

T = 1;
k = 1;

np = length(cp);    % number of control points
nc = np - 3;        % number of curves
tc = T/nc;          % time for each segment
n_samp = 100;       % number of sample points per polynomial
dt = tc/n_samp;     % delta t between samples so we can compare cost for different nc

% Arrange the control points into B-spline control points
p = cp(hankel(1:length(cp) - 3, length(cp) - 3:length(cp)))';


% B-Spline matrix
M = (1/6)*[-1  3 -3  1;
            3 -6  3  0;
           -3  0  3  0;
            1  4  1  0];

% Find the coefficients for each spline
C = M*p;


yf_prev = 0;
ydotf_prev = 0;
cost = 0;
yr_store = zeros(n_samp, nc);
% Sequentially solving the ODE
for i = 1:nc
    y0 = [yf_prev;ydotf_prev];
    t0 = 0;
    tf = tc;

    f = @(t,y) [y(2); k*([(t/tc)^3 (t/tc)^2 (t/tc) 1]*C(:,i)-y(1))];
    [ts,ysol] = ode45(f,[t0,tf],y0);

    % Cost function integration
    t_samp = linspace(0,tc,n_samp);
    yd = double( subs(yd_symb, t, t_samp) );    % desired q
    yr = interp1(ts,ysol(:,1), t_samp);         % Real q
    
    cost = cost + dt*(yd - yr)*(yd - yr)';
    
    % update initial conditions
    yf_prev = ysol(end,1);
    ydotf_prev = ysol(end,2);
    
    % store values
    yr_store(:,i) = yr'; 
end

disp(cost);


% % %plot here
figure
hold on;
for i = 1:nc
    plot(linspace(tc*(i-1),tc*i,n_samp),yr_store(:,i));
end

end
