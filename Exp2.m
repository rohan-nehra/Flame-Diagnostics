test = 2; % 1 for gaussian wave object, 2 for solid cylinder object
Nz = 100;
Ny = 100;
z = linspace(-1, 1, Nz);
y = linspace(0, 1, Ny);
[Z,Y] = meshgrid(z,y);
if (test == 1)
    F = exp(-Y.*Y/2/0.2^2);
elseif (test == 2)
    F = 2 * real(sqrt(0.3^2 - Y.*Y));
end
tic;
[zeta, r, f] = mod_abel_inversion_3_pts(z, y, F);
toc;
subplot(2,3,1:2);
imagesc(z, y, F);
title('Original image');
subplot(2,3,4:5);
imagesc(zeta, r, f);
title('Abel inverted image');
subplot(2,3,3);
plot(y, F(:,1), 'LineWidth', 2);
title('Lineout of the original image');
subplot(2,3,6);
plot(r, f(:,1), 'LineWidth', 2);
title('Lineout of the result');