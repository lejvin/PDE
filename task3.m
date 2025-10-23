clear
close all
% a)


N=2^10;
x = 2*pi*(0:N-1)/N; %%VARFÖR inte från 1 till N`?????
h = hfun(x);
 
%% 


z = mydft(h);
[a0,a,b] = myfouriercoeff(z);

% Above you have computed the Fourier coeﬃcients a0 , an , and bn of h(x)
t = linspace(0,2*pi,5000);
y3=a0;
y5=a0;
y10=a0;

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
% [NEEDS COMMENT]
figure()
plot(t,hfun(t),t,y3,t,y5,t,y10)

M=1:100;
t = linspace(0,pi,5000);
Yh = 0;
for n=M
    Y = partialfourier(n,a0,a,b,t);
    E(n) = max(Y-1);
    Yh = Yh + (2/(pi*n))*(1-(-1)^n)*sin(n*t);
    Eh(n) = max(Yh-1);
end

figure()
plot(M,E,M,Eh)