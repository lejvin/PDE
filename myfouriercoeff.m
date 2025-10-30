function [a0,a,b] = myfouriercoeff(z)
% -In data -
% z: vector containing complex Discrete Fourier transform
% - Out data -
% a0: the coefficient a_0
% a: vector with the Fourier coefficients a_n
% b: vector with the Fourier coefficients b_n

N = length(z);% Compute the length of vector z

% remove ﬁrst element z(1) from z-vector and pick out the first half
% of the z-vector (excluding the first 0 frequency, so from 2 to
% N/2+1) since it is complex symmetric. i.e. c_n = conj(c_(N-n)). Also
% take the floor to make it work for odd lengths for the input vector.
c = z(2:floor(N/2)+1);

% The first value is a0, this is the amplitude of the 0 frequency.
a0 = z(1);

% Because of the complex symmetry we can use this computationally
% cheaper method to calculate the fourier coefficients.
a = c + conj(c);
b = 1i * (c - conj(c));
