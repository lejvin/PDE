% Task 4 
% a)
clear all;
close all;
t_my = zeros(size(11));
matlab_fft = zeros(size(11));
for m =1:11
    tic 
    
   
    
    %y = linspace(0,2*pi,2^m);
    y =rand(1,2^m);
    
    g = titimydft(y);



    t_my(m) = toc;
end

for m = 1:11
    tic
    
    r = rand(1,2^m);
    f = fft(r);


    matlab_fft(m) = toc;

end

hold on; 
%ylim([-0.1,3])
plot (1:11,t_my,'-o');
plot(1:11,matlab_fft,'-o');
legend('mydft','fft');
xlabel('m');
ylabel('seconds')
hold off;

%%
%b
clear all;
close all;
clc;


fid = fopen('filtre.data','r'); % open filtre.data
Y = fscanf(fid,'%f',[1 inf]); % read filtre.data
fclose(fid);
%figure(), plot(Y) % plot filtre.data



Z=fft(Y); % transform data
figure;
plot(abs(Z));

wcut=80; % cut-off
N=length(Z);
    for j=1:N
        if (abs(Z(j)) < wcut) % cut-off small amplitude frequencies
            Z(j) = 0;
        end
     
    end
    Z = ifft(Z);
 figure()
hold on;
plot(Z);
%plot(Y)
legend('filter');
hold of;
%%
%c)
clear all; 
close all;
clc;

load('splat');% load sound, e.g: 'splat','gong','handel','train'
sound(y,Fs); % play sound
Y = fft(y);% fft from Matlab
W=Y;

M=max(abs(Y));
r = 0.03*M; % specify the relative threshold value %ωr 
N = length(y);
for j=1:N
    if (abs(W(j))<r) % compress
        W(j) =0;
    end
end

% compressed signal and original signal expressed as a sparse array
WS = sparse(W);
YS = sparse(Y);
% compare size before-after
before = whos('YS');
after = whos('WS');
comprRatio = before.bytes/after.bytes
% play back the sound
pause(5);% delay in order to finish playing original sound
disp('Play compressed signal');
w= real(ifft(full(WS)));
sound(w, Fs)
