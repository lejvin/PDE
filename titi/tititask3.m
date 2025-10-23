% Task 3 a
clear all;
% Above you have computed the Fourier coefficients a0, an, and bn of h(x)
t = linspace(0,2*pi,5000); % i uppgift b ändra till pi istället för 2pi/jonnes
N= 2^5;
for j = 1:N
    x(j) = 2*pi*j/N;  
end

%x = linspace(0,2*pi,100);
h = hexact(x,2*pi);
%h = @(t) (mod(t, 2*pi) > 0 & mod(t, 2*pi) < pi).*1 + (mod(t, 2*pi) > pi & mod(t, 2*pi) < 2*pi).*(-1);

r= titimydft(h);
[a0,a,b]= titimyfouriercoeff(r);
%%
index_bn = find(abs(b)>0.1) % hämtar på vilket index som an är på
storlek_index_bn = b(abs(b)>0.1) % vad aär 

index_an = find(abs(a)>0.1) % hämtar på vilket index som an är på
storlek_index_an = a(abs(a)>0.1) % vad aär 
%%

%M=N/2;% the number of terms M must be less than N/2 where N = 2m points
%a)
y=a0;
y1 = a0;

y2 = a0;
y3 = a0;

for j=1:3 % The partial sum of the Fourier series with M+1 terms
    y1=y1+a(j)*cos(j*t)+b(j)*sin(j*t);% add a term of the Fourier series
end
ft(Y); % transform data

for j=1:5 % The partial sum of the Fourier series with M+1 terms
    y2=y2+a(j)*cos(j*t)+b(j)*sin(j*t);% add a term of the Fourier series
end

for j=1:10 % The partial sum of the Fourier series with M+1 terms
    y3=y3+a(j)*cos(j*t)+b(j)*sin(j*t);% add a term of the Fourier series
end
figure()

plot(t,h);% plot h together with several of the partial sums of the Fourier series
hold on 
plot(t,y1);
plot(t,y2);
plot(t,y3);
legend('h(x)','M=3','M=5','M=10');
hold off

%%
%Task 3 b)

% Här nedanför låtter jag t vektorn vara samma som i orginalet, borde den
% ändras så att t = linspace(0,pi,5000); då vi skulle undersöka kring
% 0<x<pi?
%b)
clear all;
close all;
N= 2^10;
for j = 1:N
    x(j) = 2*pi*j/N;  
end

%x = linspace(0,2*pi,N);
h = hexact(x,2*pi);
r= titimydft(h);
[a0,a,b]= titimyfouriercoeff(r);

t = linspace(0,pi,5000); % 
M = 1:100;    % med hans kommentar "You may want to try different N" så kanske han menar att man
% ska definera M som M=1:(N/2 -1) typ eller något annat.
u = zeros(size(t));
sm = zeros(size(t));
E_M = zeros(size(M));
E_R = zeros(size(M));
h_riktig = zeros(size(M));

for j = 1:numel(M)
    u=zeros(size(t)); % resetar u för varje loop 

    for k = 1:M(j)
        u = u+ a(k)*cos(k*t) + b(k)*sin(k*t);%räknar ut summan av fourieserien 
    end
    sm = u + a0;% adderar a0 till summan 
    E_M(j) = max(sm-1); % beräknar fellet 
end

for j=1:numel(M)
    h_riktig =zeros(size(t));
    for g=1:M(j)
        h_riktig= h_riktig + (((2/(pi*g))*(1-(-1)^g))*sin(g*t));% här beränas den exakta fourierserien för h(x), 
        % notera att a0=0,an=0 ,bn = h_riktig
    end
    E_R(j)= max(h_riktig-1);
end

hold on
xlabel('M (Number of Terms in partial sum)');
ylabel('Error E_M');
title('Error in Fourier Series Approximation');
grid on;
plot(M,E_M,'LineWidth',1);
plot(M,E_R,'LineWidth',1);
legend('Numeriska E_M','"Riktiga" E_M');
hold of