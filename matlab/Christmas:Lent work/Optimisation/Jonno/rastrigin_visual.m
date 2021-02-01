clc; clear; close all;

x1 = linspace(-5.12,5.12,500); % design space for parameter x1
x2 = linspace(-5.12,5.12,500); % design space for paramter x2

[X1,X2] = meshgrid(x1,x2); % makes mesh of whole design space 

Z = zeros(size(X1)); % set cost function matrix of whole design space

for i = 1:numel(X1)
    Z(i) = rastriginfcn([X1(i),X2(i)]); % get cost function for cobination
end


figure(3)
mesh(X1,X2,Z)
set(gca,'fontname','times','FontSize',20)
xlabel('x_1')
ylabel('x_2')
zlabel('f(x_1,x_2)')

figure(4)
contour(X1,X2,Z)