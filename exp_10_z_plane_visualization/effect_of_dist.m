clear all; close all; clc;
w = linspace(-pi, pi, 1001); % Frequency range
r = 1; % Assuming r = 1 (you can change this as needed)
z = r .* exp(1j * w); % Compute Z values
% % First Transfer Function H = z / (z - 0.5)
H1 = z ./ (z - 0.5);
% % Second Transfer Function H = z / (z - 0.99)
H2 = z ./ (z - 0.99);
% % Third Transfer Function H = z / (z - 0.1)
H3 = z ./ (z - 0.1);
% Plot the magnitude of the first transfer function
subplot(3,1,1);
plot(w, abs(H1)); % Magnitude of H1
xlabel('\omega');
ylabel('|H(\omega)| at z = 0.5');
grid on;
% Plot the magnitude of the second transfer function
subplot(3,1,2);
plot(w, abs(H2)); % Magnitude of H2
xlabel('\omega');
ylabel('|H(\omega)| at z = 0.99');
grid on;
% Plot the magnitude of the third transfer function
subplot(3,1,3);
plot(w, abs(H3)); % Magnitude of H3
xlabel('\omega');
ylabel('|H(\omega)| at z = 0.1');
grid on;