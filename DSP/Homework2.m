% Start with a clean slate.
close all;
clear

figure(1)
% show pole zero plot.
zplane( [1 2 1], [1] );

figure(2)
% show pole zero plot.
zplane( [1 2 1], [1 -0.707] );

figure(3)
% show pole zero plot.
zplane( [1 -2 1], [1 1 0.707] );