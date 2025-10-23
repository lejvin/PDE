


N = 2^10;
% Hur varje x_j ser ut 
for j = 1:N
    x(j) = 2*pi*j/N;  
end
g = abs(cos(x));
%x = linspace(0,2*pi,N);

y = 3 - 2*cos(15*x) + 4*sin(20*x); % så man kan sätt in i titimydft
g = abs(cos(x));
z = titimydft(g);  % få ut dft 
[a0,a,b]=titimyfouriercoeff(z); % får utt foriercoficienterna i 1xN matris
% en för varje b_n, dvs b_1,b_2,_b_3 osv.

index_an = find(abs(a)>0.1); % hämtar på vilket index som an är på
storlek_index_an = a(abs(a)>0.1); % vad aär 

aexact = zeros(1,N/2);
a0exact = 2/pi; 

for t = 1:(N/2-1)
    aexact(2*t) = (-1)*(4/pi)*((-1)^(t))/((4*(t)^2)-1);
end

% Mats kod
% Above you calculate the discrete Fourier transform z
% and the exact Fourier cosine coefficients a0 =a0exakt and (an) =aexact
[a0,a,b] =titimyfouriercoeff(z);% cosine coefficients calculated from the DFT z
figure()
stem([a0 a],'*')% plot computed Fourier cosine coefficients
hold on
stem([a0exact aexact],'or')% plot exact Fourier cosine coefficients
xlim([1 10])
hold off
xlabel('n'); ylabel('Fourier cosine coefficients an');
title('Exact and computed Fourier coefficients')
legend('Computed','Exact');

%%taske 3
