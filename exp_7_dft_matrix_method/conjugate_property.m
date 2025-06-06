clc; clear all; close all;
% Input sequence
x = input('Enter the signal x(n) : ');
N = length(x);
% Compute DFT manually using summation formula
X = zeros(1, N); % Initialize DFT output
for k = 1:N % Frequency index
 for n = 1:N % Time index
 X(k) = X(k) + x(n) * exp(-1j * 2 * pi * (k-1) *(n-1) / N);
 end
end
% **Manual Conjugate Calculation
X_conj = zeros(1, N);
for i = 1:N
 X_conj(i) = real(X(i)) - 1j * imag(X(i)); %Conjugate manually
end
% Compute DFT of X_conj manually
X_conj_dft = zeros(1, N);
for k = 1:N
 for n = 1:N
 X_conj_dft(k) = X_conj_dft(k) + X_conj(n)* exp(-1j * 2 * pi * (k-1) * (n-1) / N);
 end
end
% Compute IDFT using the property
x_recon = (1/N) * X_conj_dft;
% Display results
disp('Original Signal x(n):');
disp(x);
disp('Reconstructed Signal using IDFT Property:');
disp(real(x_recon)); % Taking real part to avoid numerical errors
% Plot Magnitude Spectra
figure;
subplot(2,2,1);
stem(abs(X), 'r', 'filled'); grid on;
title('Magnitude Spectrum of X(k)');
xlabel('k'); ylabel('|X(k)|');
subplot(2,2,2);
stem(abs(X_conj), 'b', 'filled'); grid on;
title('Magnitude Spectrum of X*(k)');
xlabel('k'); ylabel('|X*(k)|');
subplot(2,2,3);
stem(abs(X_conj_dft), 'k', 'filled'); grid on;
title('Magnitude Spectrum of DFT(X*(k))');
xlabel('k'); ylabel('|DFT(X*(k))|');
subplot(2,2,4);
stem(real(x_recon), 'g', 'filled'); grid on;
title('Reconstructed Signal using IDFT Property');
xlabel('n'); ylabel('x(n)');