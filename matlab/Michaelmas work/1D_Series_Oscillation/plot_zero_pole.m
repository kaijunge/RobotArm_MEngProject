figure;
hold on;
grid on;

scatter(real(p),imag(p),200,"x");
scatter(real(z),imag(z),300);

%yticks([-10 10]);

yline(0)
xline(0)
xlabel("Real")
ylabel("Imaginary")

ax = gca;
ax.YAxis.FontSize = 15;
ax.XAxis.FontSize = 15;

legend("Poles","Zeros", ...
    "Fontsize",14, "location", "northwest");
%line([0,0], ylim, 'Color', 'k', 'LineWidth', 2); % Draw line for Y axis.
%line(xlim, [0,0], 'Color', 'k', 'LineWidth', 2); % Draw line for X axis.