clear all;
close all;
RGB = imread('C:\Users\Dell\Desktop\BTP\Final Images\1.png');
I= rgb2gray(RGB);
figure
x = linspace(-1,1,384);
a1 = I(86,:);
a2 = I(195,:);
a3 = I(425,:);
plot(x,a1,LineWidth=2)
hold on
plot(x,a2,LineWidth=2)
hold on
plot(x,a3,LineWidth=2)
hold off
legend('z/d ~ 1.03','z/d ~ 0.75','z/d ~ 0.15')
title('Intensity of distribution')
ylabel('Intensity(A.U.)')
xlabel('r/d')
