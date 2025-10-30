% a) 
clear
close all

N = 2.^(0:11);
t_f = zeros(1,length(N));
t_matlab_f = zeros(1,length(N));

for i = 1:length(N)
    y = rand(1,N(i));
    f = @() mydft(y);
    matlab_f = @() fft(y);

    % Measure execution time for both DFT implementations
    t_f(i) = timeit(f);
    t_matlab_f(i) = timeit(matlab_f);
    
end
figure()
plot(t_f)
hold on
plot(t_matlab_f)

%%
clear
close all

% b)

fid = fopen('filtre.data','r');
Y = fscanf(fid,'%f',[1 inf]);
fclose(fid);
figure(), plot(Y)
Z = fft(Y);

plot(Y)

wcut = 1;
N = length(Z);
for j = 1:N
    if (abs(Z(j)) < wcut)
        Z(j) = 0;
    end
end

newY = ifft(Z);

figure(), plot(newY)

%%
close
clear all
% c)

load('train')
sound(y,Fs)
Y = fft(y);
W = Y;
M = max(abs(Y));
omega_r = 0.8;
N = length(y);
for j = 1:N
    if (abs(Y(j)) < omega_r * M)
        W(j) = 0;
    end
end

WS = sparse(W);
YS = sparse(Y);

before = whos('YS');
after = whos('WS');
comprRatio = before.bytes/after.bytes;
pause(4);
disp(comprRatio);
disp('Play compressed signal');
w = real(ifft(full(WS)));
sound(w,Fs)





