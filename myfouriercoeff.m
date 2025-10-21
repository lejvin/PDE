function [a0,a,b] = myfouriercoeff(z)
% -In data -
% z: complex Fourier transform
% - Out data -
% a0: the coeﬃcient a0
% a: vector with the Fourier coeﬃcients an
% b: vector with the Fourier coeﬃcients bn
N = length(z);% Compute the length of vector z
c= z(2:floor(N/2));% remove ﬁrst element z(1) from z-vector
a0 = z(1);

a = c + conj(c);
b = 1i * (c - conj(c));