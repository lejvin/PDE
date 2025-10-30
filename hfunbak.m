function h = hfun(x)
%H Summary of this function goes here
%   Detailed explanation goes here

rest = mod(x,2*pi);

%Preallocate
h = zeros(1,length(x));

h(rest > 0 & rest < pi) = 1;
h(rest > pi & rest < 2*pi) = -1;

end

