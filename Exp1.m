close all;
clear all;

figure
%Import RGB Image
subplot(1,2,1)
RGBimg = imread('m44.jpg');
RGB = rgb2gray(RGBimg);
imshow(RGBimg);
title('RGB');

% Smoothing
% subplot(2,3,2)
Smooth = imgaussfilt(RGB,6);
% imshow(Smooth);
% title('Smoothing');
%Sharpening
% subplot(2,3,3)
Sharp = imsharpen(Smooth,'Radius',10,'Amount',10);
% imshow(Sharp)
% title('Sharpening');
%Binary Image
% subplot(2,3,4)
Binary = im2bw(RGB,0.8);
% imshow(Binary)
% title('Binary Image');
%Noise Removal
% subplot(2,3,5)
biggestBlob = bwareafilt(Binary, 1);
% imshow(biggestBlob)
% title('Noise Removal')
%Flame Detection and Height Calculation

subplot(1,2,2)
maskedRgbImage_ = bsxfun(@times, RGB, cast(biggestBlob, 'like', RGB));
props = regionprops(biggestBlob, 'BoundingBox');
boundingBox = [props.BoundingBox];
pos = boundingBox;
imshow(RGB)
hold on;
str = sprintf('Height = %0.0f',boundingBox(4));
rectangle('Position', boundingBox, 'LineWidth', 1, 'EdgeColor', 'r')
text(pos(1) + pos(3)/2,pos(2) + pos(4),str ,'VerticalAlignment','top','HorizontalAlignment','center','Color', 'r')
title('Final Image');