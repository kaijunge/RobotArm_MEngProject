opts = bodeoptions();%'cstprefs');
opts.Title.String = 'Closed loop reference to plamnt output';
opts.Title.FontSize = 19;
opts.TickLabel.FontSize = 16;
opts.XLabel.FontSize = 16;
opts.YLabel.FontSize = 16;
opts.Xlim = [0.5 50];%[1, 25];
opts.Ylim = [-5 5];%[1, 25];
opts.Grid = 'on';
opts.PhaseVisible = 'off';

bode(linsys1,linsys2, opts);
[h,icons] =legend("k=1 Wn=1 Z=0.1","k=100 Wn=10 Z=0.1", ...
    "Fontsize",14);
set(findall(gcf,'type','line'),'linewidth',2);


% Find the 'line' objects
icons = findobj(icons,'Type','line');
% Find lines that use a marker
icons = findobj(icons,'Marker','none','-xor');
% Resize the marker in the legend
set(icons,'MarkerSize',20);

%legend("kp=100 kd=1000","kp=100 kd=100", "kp=10 kd=10", ...
%    "Fontsize",14);