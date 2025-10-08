function y = myidft(z)
% Compute the DFT of a vector y of length N

N = length(z);
j = 0:(N-1); % row vector containing the indexes needed for the sum
n = j'; % column vector containing indexes, needed to use matrix multiplication instead of for loops
omega = exp (2*pi*1i/N); % here i is the imaginary unit


y = z*omega.^(n*j); 



