% Start with a clean slate.
close all;
clear

figure(1)
% show pole zero plot.
zplane( [1 2 1], [1] );

% Compute the frequency response of H(z) from equation.
w = [0:pi/512:pi];
ejw = exp( i * w );
Hejw = 0.25*( ejw.*ejw + 2*ejw + 1 ) ./ ( ejw.*ejw );

% plot results.
figure(2);
fs = 10e3; % Set sampling frequency to 10 KHz.
subplot( 211 ),plot( fs*w/(2*pi), abs( Hejw ) );
title( 'Magnitude Response of H(z)' );
xlabel( 'Frequency in Hertz' );
ylabel( 'Magnitude Response (Gain)' );
xlim( [0 fs/2] ),grid;
subplot( 212 ),plot( fs*w/(2*pi), angle( Hejw ) );
title( 'Phase Response of H(z)' );
xlabel( 'Frequency in Hertz' );
ylabel( 'Phase angle (Radians)' );
xlim( [0 fs/2] ),grid;