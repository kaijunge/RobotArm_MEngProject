figure;
hold on;
plot(out.force)
%plot(out.y,"DisplayName", "y")
%plot(out.x,"DisplayName", "x")
%plot(out.r,"DisplayName", "Ref")

xlabel("Time (s)");
ylabel("Force (N)");

ax = gca;
ax.YAxis.FontSize = 15;
ax.XAxis.FontSize = 15;

legend("Actual","Desired","Location", "northeast", "Fontsize",15);