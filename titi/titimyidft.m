%
% 
function y = titimyidft(z)
% Compute the DFT of a vector y of length N
% Det här är försöket att skriva om den i for loppar.
%z=[5,(3-2i),-3,(3 + 2i)];
N = length(z);
y = zeros(1,N);
j = 1:N;


omega = exp (2*pi*1i/N);% here i is the imaginary unit

for n = 1:N
        y(n) =sum(z.*omega.^((n-1).*(j-1)));


end
end