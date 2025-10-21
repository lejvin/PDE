clear
close all

N=2^10;
x = 2*pi*(0:N-1)/N; %%VARFÖR inte från 1 till N`?????
h = hfun(x);
 
%% 


z = mydft(h);
[a0,a,b] = myfouriercoeff(z);

% Above you have computed the Fourier coeﬃcients a0 , an , and bn of h(x)
t = linspace(0,2*pi,5000);
y=a0;
M=10;
for j=1:M % The partial sum of the Fourier series with M+1 terms
    y=y+a(j)*cos(j*t)+b(j)*sin(j*t);% add a term of the Fourier series
end
figure()
plot(t,hfun(t),t,y)
