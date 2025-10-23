%
% 
 function z = titimydft(y)
% Compute the DFT of a vector y of length N
% Det här är försöket att skriva om den i for loppar.
N = length(y);
z = zeros(1,N);
j = 1:N;



% z n = 1/N sum {j=0}ˆ{N-1}y j exp(-2 pi j n/N

omega = exp (2*pi*1i/N);% here i is the imaginary unit

for n = 1:N
  
    z(n) = (1/N)*sum(y.*omega.^(-(n-1).*(j-1)));
 
end


%for n = 1:N
    %s=0;
   %for j= 1:N
     %s=s +y(j)*omega.^(-(n-1).*(j-1)); 
   %end
   % z(n) = (1/N)*s;
 
%end

