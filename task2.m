clear
close all
% a) 
% Find, by inspection, the exact Fourier series 
% coeﬃcients ai and bi of the 2π-periodic function

%f(x) = 3 − 2 cos(15x) + 4 sin(20x).

%a0 = 3
%a15 = -2
%b20 = 4

N_1 = 2^5;
x1 = 2*pi*(0:N_1-1)/N_1;
y1= 3 - 2*cos(15*x1) + 4 * sin(20*x1);
z1 = mydft(y1);
[a0_1, a_1, b_1] = myfouriercoeff(z1);

N_2 = 2^8;
x2 = 2*pi*(0:N_2-1)/N_2;
y2= 3 - 2*cos(15*x2) + 4 * sin(20*x2);
z2 = mydft(y2);
[a0_2, a_2, b_2] = myfouriercoeff(z2);

% b)
% The function g(x)
g = @(x) abs(cos(x));

% Use appropriate N 
N_g = 2^8;

% define x for the interval [0,2pi]
x_g = 2*pi*(0:N_g-1)/N_g;
z_g = mydft(g(x_g));
[a0_g, a_g, b_g] = myfouriercoeff(z_g);
a_g = a_g(2:2:end);



% Plot against exact coefficients
a0exact = 2/pi;
aexact = (-4*(-1).^(1:N_g/4))./(pi*(4*(1:N_g/4).^2 -1 ));
figure()
stem([a0_g a_g],'*')% plot computed Fourier cosine coeﬃcients
hold on
stem([a0exact aexact],'or')% plot exact Fourier cosine coeﬃcients
xlim([1 10])
hold on
xlabel('n'); ylabel('Fourier cosine coefficients an ');
title('Exact and computed Fourier coefficients')
legend('Computed','Exact');
