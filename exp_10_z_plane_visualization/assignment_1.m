%H(z) = z(z-0.5cos(\pi/4)) / 2·(z - e^{-jπ/4}/2)(z - e^{jπ/4}/2)
clear all; close all; clc;
% Define zeros
z1 = 0;
z2 = sqrt(2)/4;
zeros = [z1, z2];
% Define poles (conjugate complex)
p1 = (1/2)*exp(1j*pi/4);
p2 = (1/2)*exp(-1j*pi/4);
poles = [p1, p2];
% Get numerator and denominator coefficients
num = poly(zeros); % z*(z - sqrt(2)/4)
den = 2 * poly(poles); % 2*(z - e^jπ/4/2)*(z - e^-jπ/4/2)
% Plot pole-zero plot
zplane(num, den);
title(' Pole-Zero Plot of H(z)= z(z-0.5cos(\pi/4)) / 2·(z - e^{-jπ/4}/2)(z - e^{jπ/4}/2)');
grid on;
