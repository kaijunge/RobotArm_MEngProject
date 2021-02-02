function [outputArg1,outputArg2] = plot_spline(cp, T)


np = length(cp);    % number of control points
nc = np - 3;        % number of curves
tc = T/nc;          % time for each segment
n_samp = 100;       % sample points


p = cp(hankel(1:length(cp) - 3, length(cp) - 3:length(cp)))';


figure
hold on;
for i = 1:nc
    t = linspace(tc*(i-1),tc*i,n_samp);
    x = bspline(t,tc,p(:,1));
    plot(t,x);
end



end

