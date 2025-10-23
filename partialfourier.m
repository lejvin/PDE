function Y = partialfourier(M,a0,a,b,t)
%UNTITLED Compute the partial fourier for task 3
%   Detailed explanation goes here

Y=a0;
if mod(M,1)==0 && M>0
    for j=1:M% The partial sum of the Fourier series with M+1 terms
        Y=Y+a(j)*cos(j*t)+b(j)*sin(j*t);% add a term of the Fourier series
    end
    
else
    error("M is not an integer")
end


