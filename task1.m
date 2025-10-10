% Task 1
% Create mydft.m and myidft.m and and use them.
clear

%% Test of functions

y1 = [8 12 -4 4]
z1 = mydft(y1)

myidft(z1)


%% Results to include in report

y2 = [0, 3, -2*sqrt(3), 6, 2*sqrt(3),3]
z2 = mydft(y2)
w2 = myidft(y2)