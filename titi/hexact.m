function y = hexact(x,intervall_lenght)
    
    x = mod(x,intervall_lenght);
    y = zeros(size(x));
   
    y(x>0 & x<pi) =1;
    y(x>pi & x< 2*pi) = -1;

end