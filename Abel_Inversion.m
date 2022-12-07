clear all;
close all;
Nz = 200;
Ny = 200;
z = linspace(0, 1, Nz);
y = linspace(0, 1, Ny);

RGB = imread('ee1.png');
gray = rgb2gray(RGB);
F = im2double(gray);

[zeta, r, f] = mod_abel_inversion_3_pts(z, y, F);
f_img = im2uint8(f);

subplot(2,3,1);
imshow(gray);
title('Original image');
subplot(2,3,2);
imshow(f_img);
title('Abel inverted image');
subplot(2,3,3)
Binary = im2bw(f_img,0.08);
imshow(Binary)
title('Binary');
subplot(2,3,4)
biggestBlob = bwareafilt(Binary, 1);
biggestBlob = imfill(biggestBlob,'holes');
imshow(biggestBlob);
title('Noise Removal')
props = regionprops(biggestBlob, 'BoundingBox');
boundingBox = [props.BoundingBox];
pos = boundingBox;
subplot(2,3,5)
imshow(RGB)
hold on;
str = sprintf('Height = %0.0f \n Width = %0.0f',boundingBox(4),boundingBox(3));
rectangle('Position', boundingBox, 'LineWidth', 1, 'EdgeColor', 'r')
text(pos(1) + pos(3)/2,pos(2) + pos(4),str ,'VerticalAlignment','top','HorizontalAlignment','center','Color', 'r')
title('Final Image');

h = boundingBox(4);
w = boundingBox(3);
sine_alpha = (w/2)/(sqrt(w*w/4 + h*h));
disp(sine_alpha);
