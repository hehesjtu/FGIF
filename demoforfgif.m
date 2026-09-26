%close all;
%clear all;
%clear; clc;

I = im2double(imread('data/35010.png'));
p = I;
r = 32;
eps = 0.01;
[H, W, C] = size(I);

q = zeros(H, W, C);
beta = zeros(H, W, C);

[q(:,:,1), beta(:,:,1)] = FGIF(I(:,:,1), p(:,:,1), r, eps);


[q(:, :, 2),beta(:, :, 2)] = FGIF(I(:, :, 2), p(:, :, 2), r, eps);

[q(:, :, 3),beta(:, :, 3)]= FGIF(I(:, :, 3), p(:, :, 3), r, eps);

I_enhanced = ( I- q ) .* beta + q;


    
figure;
subplot(1,2,1);imshow(I);title('input');
subplot(1,2,2);imshow(I_enhanced);title('enhanced');