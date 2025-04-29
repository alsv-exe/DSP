%H(z) = z·sin(\pi/4) / 2·(z - e^{-jπ/4}/2)(z - e^{jπ/4}/2)
clear all; close all; clc;
% Numerator zero
z0 = 0; % zero at origin
gain = sin(pi/4); % gain from numerator
% Poles (complex conjugates)
p1 = (1/2) * exp(1j * pi/4);
p2 = (1/2) * exp(-1j * pi/4);
% Get coefficients
num = gain * poly([z0]); % z * sin(pi/4)
den = 2 * poly([p1, p2]); % 2 * (z - e^jpi/4/2)(z - e^-jpi/4/2)
% Plot pole-zero plot
zplane(num, den);
title('Pole-Zero Plot of H(z) = z·sin(\pi/4) / 2·(z - e^{-jπ/4}/2)(z - e^{jπ/4}/2)');
grid on;