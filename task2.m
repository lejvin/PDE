clear
%a) Find, by inspection, the exact Fourier series 
% coeﬃcients ai and bi of the 2π-periodic function

%f(x) = 3 − 2 cos(15x) + 4 sin(20x).

%a0 = 3
%a15 = -2
%b20 = 4

N = 2^8
x = 2*pi*(0:N-1)/N
y= 3 - 2*cos(15*x) + 4 * sin(20*x)
z = mydft(y)
[a0 a b] = myfouriercoeff(z)

