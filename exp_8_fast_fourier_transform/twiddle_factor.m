N = input('Enter the value of N: '); % Number of DFT points
syms W_N;
fprintf('Twiddle Factor Matrix W_%d: \n', N);

for n = 0:N-1
    for k = 0:N-1
        fprintf('W_%d^{%d%d}  ', N, n, k);
    end
    fprintf('\n'); % New line after each row
end
