opts = bodeoptions('cstprefs');
opts.Title.String = 'Bode plot from reference to plant input';
opts.Title.FontSize = 19;
opts.TickLabel.FontSize = 17;
opts.XLabel.FontSize = 17;
opts.YLabel.FontSize = 17;
opts.Xlim = [0.5 50];%[1, 25];

bode(linsys4,linsys5,linsys6,opts);
%legend("Wn=1 Z=0.1","Wn=10 Z=0.1", ...
%    "Fontsize",14);

legend("kp=100 kd=1000","kp=100 kd=100", "kp=10 kd=10", ...
    "Fontsize",14);