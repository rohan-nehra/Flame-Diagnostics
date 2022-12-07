clear all;
close all;
x = [0.3,0.45,0.6,0.8,1.1,1.2,1.3];
y = [121,140,184,232,387,422,504]*0.0175;  
z = x*(4.5);
figure
plot(x,y,'-*',x,z,'-o',LineWidth=2)
xlabel('Fuel Flow Rate in LPM','fontweight','bold')
ylabel('Flame Height in cm','fontweight','bold')
legend('Experimental Method','Empirical Method')
title('Relation between Flame Height and Fuel Flow Rate','fontweight','bold')