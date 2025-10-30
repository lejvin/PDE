function z = mydft(y)
% Compute the DFT of a vector y of length N

N = length(y);
j = 0:(N-1); % row vector containing the indexes needed for the sum
n = j'; % column vector containing indexes, needed to use matrix multiplication instead of for loops
omega = exp (2*pi*1i/N); % 1i specifies the imaginary unit

% Uses element wise multiplication in combination with matrix
% multiplication to sum over j and output a row vector z_n
z = (1/N) .* y*omega.^(-n*j); 

