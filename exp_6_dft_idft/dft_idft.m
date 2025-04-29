clear all;            % Clears all variables from the workspace
close all;            % Closes all figure windows
clc;                  % Clears the command window

% Prompt the user to input the value of N (the length of the signal)
N = input('Enter the value of N= ');  % Signal length
n = 0:1:N-1;          % Create a vector of time indices (0 to N-1)

% Prompt the user to input the signal x(n)
x = input('Enter input signal x(n): ');  % Input the signal x(n)

%%%%% Manual computation of DFT (Discrete Fourier Transform) %%%%%
X = zeros(N, 1);  % Initialize a vector to store the DFT values (X[k])

% Nested loops for manually computing the DFT using the formula:
% X[k] = sum(x[n] * exp(-j * 2 * pi * n * k / N)) for n = 0 to N-1
for k = 0:N-1      % Loop over frequency index k (0 to N-1)
    for nn = 0:N-1  % Loop over time index n (0 to N-1)
        % Apply the DFT formula: X[k] = sum(x[n] * exp(-j * 2 * pi * n * k / N))
        X(k+1) = X(k+1) + (x(nn+1) * exp(-1j * 2 * pi * nn * k / N));
    end
end

% Take the absolute value of the DFT result and transpose it for plotting
X = abs(X)';  % Only the magnitude of the DFT is considered for plotting

%%%%% Compute the Inverse DFT (IDFT) using the manual method %%%%%
x_manual = zeros(N,1);
for nn = 0:N-1
    for k = 0:N-1
        % Manual computation of IDFT: x[n] = 1/N * sum(X[k] * exp(j * 2 * pi * n * k / N))
        x_manual(nn+1) = x_manual(nn+1) + (X(k+1) * exp(1j * 2 * pi * nn * k / N));
    end
end
x_manual = abs(x_manual / N);  % Normalize and take absolute value

%%%%%% Using FFT command to compute the DFT %%%%%
X_fft = abs(fft(x));  % Compute the DFT using the FFT function and take the magnitude

%%%%%% Using IFFT command to compute the IDFT %%%%%
x_ifft = ifft(X_fft);  % Compute the IDFT using the IFFT function

% Create a figure with 6 subplots in a 3x2 grid
figure;

% Plot 1: Original signal
subplot(3, 2, 1:2);
stem(n, x);grid on;  % Plot the original signal x(n)
xlabel('Freq (n)');
ylabel('X(n)');
title('Original Signal');

% Plot 3: DFT using FFT command
subplot(3, 2, 5);
stem(n, X_fft);grid on;   % Plot the magnitude of the DFT computed by FFT
xlabel('Frequency (k)');
ylabel('X(k) command');
title('DFT using FFT command');

% Plot 2: Manually computed DFT
subplot(3, 2, 3);
stem(n, X);grid on;   % Plot the magnitude of the manually computed DFT
xlabel('Frequency (k)');
ylabel('X(k) manual');
title('Manual Computation of DFT');

% Plot 4: Reconstructed signal using manual IDFT
subplot(3, 2, 4);
stem(n, real(x_manual));grid on;   % Plot the real part of the manually reconstructed signal
xlabel('Time (n)');
ylabel('Amplitude');
title('Reconstructed Signal using Manual IDFT');

% Plot 5: Reconstructed signal using IFFT
subplot(3, 2, 6);
stem(n, real(x_ifft));grid on;   % Plot the real part of the reconstructed signal using IFFT
xlabel('Time (n)');
ylabel('Amplitude');
title('Reconstructed Signal using IFFT');

