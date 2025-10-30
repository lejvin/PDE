clear
close all
% a)

N=2^10;
x = 2*pi*(0:N-1)/N; 
h = hfun(x); % Defined at the bottom of this file
 
 

z = mydft(h);
[a0,a,b] = myfouriercoeff(z);

% Above you have computed the Fourier coeﬃcients a0 , an , and bn of h(x)
t = linspace(0,2*pi,5000); %
y3=a0;
y5=a0;
y10=a0;

% I could not figure out a better way to do this then with 3 for loops
for j=1:3 % The partial sum of the Fourier series with M+1 terms
    y3=y3+a(j)*cos(j*t)+b(j)*sin(j*t); % add a term of the Fourier series
end
for j=1:5 % The partial sum of the Fourier series with M+1 terms
    y5=y5+a(j)*cos(j*t)+b(j)*sin(j*t); % add a term of the Fourier series
end
for j=1:10 % The partial sum of the Fourier series with M+1 terms
    y10=y10+a(j)*cos(j*t)+b(j)*sin(j*t); % add a term of the Fourier series
end

%plot h together with several of the partial sums of the Fourier series
figure()
plot(t,hfun(t),t,y3,t,y5,t,y10)% (t,hfun(t)) is the exact function.
xlim([0 2*pi]) % plot from 0 to 2*pi
xlabel('x')
ylabel('h(x)')
legend('h(x)','S_3(x)','S_5(x)','S_{10}(x)')
title(' Comparsion of the function h(x) and three partial fourier sums')


%% 
% b)

t = linspace(0,pi,5002);
t = t(2:end-1); % exclude the points x=0 and x=pi

M = 1:100;

Yh = 0;

for n=M
    Y = partialfourier(n,a0,a,b,t);
    E(n) = max(Y-1);
    Yh = Yh + (2/(pi*n))*(1-(-1)^n)*sin(n*t);
    Eh(n) = max(Yh-1);
end

figure()
plot(M,E,M,Eh) 
xlabel('M')
ylabel('E(M)')
legend('Error for computed coefficients','Error for exact coefficients')
title('Comparsion: Error of mydft and error of exact partial fourier sum')



% Function for h(x)!
function h = hfun(x)
%HFUN the 2-pi periodic function required for task 3

% Uses the modulus to  make the function periodic.
rest = mod(x,2*pi);

%Preallocate
h = zeros(1,length(x));

h(rest > 0 & rest < pi) = 1;
h(rest > pi & rest < 2*pi) = -1;

end

