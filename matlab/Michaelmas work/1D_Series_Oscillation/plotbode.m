opts = bodeoptions();%'cstprefs');
opts.Title.String = 'Closed loop reference to input x';
opts.Title.FontSize = 19;
opts.TickLabel.FontSize = 17;
opts.XLabel.FontSize = 17;
opts.YLabel.FontSize = 17;
opts.Xlim = [0.5 50];%[1, 25];
%opts.Ylim = [-5.1 5];%[1, 25];
opts.Grid = 'on';
opts.PhaseVisible = 'off';

bode(linsys3, linsys4, opts);
legend("k = 10","k = 50", ...
    "Fontsize",14);
set(findall(gcf,'type','line'),'linewidth',2);

%legend("kp=100 kd=1000","kp=100 kd=100", "kp=10 kd=10", ...
%    "Fontsize",14);