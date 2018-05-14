% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
% TITLE: Sampling and Reconstruction with DFT filter. 
%
% Purpose: To  applying the Discrete Fourier Transform (DFT) to a
% variety of signal processing problems.
% 
% Date created: 07/30/2016 Author: Tamoghna Chattopadhyay
% Date modified: rev1 - 08/02/2016
% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

% Generate 8192 samples of x(t) at a sampling rate of 100K (10 u seconds).
n = [0:8191];
x = cos( 2*pi*(160/100)*n ) + 0.5 * sin( 2*pi*(180/100)*n );

% Compute the DFT and plot its magnitude for the sampled signal
X = fft(x);
figure(1); 
subplot(211),plot( abs(X) );
title( 'Fourier Transform of Original' );
xlabel( 'Frequency (Hertz)');
ylabel( 'Magnitude (unknown) ');

% Insert 3 zeros between each sample 
x1 = ins_zeros( x, 4 );

% The spectrum of the up sampled signal
X1 = fft(x1);
subplot(212),plot( abs(X1) );
title( 'Fourier Transform of Zero Inserted' );
xlabel( 'Frequency (Hertz)');
ylabel( 'Magnitude (unknown) ');

% Construct a normalized frequency array ( 0 to 1 matches 0 to fs/2 )
f = [0:length(X1)-1]/length(X1);

% Apply Highpass Filter to the transform
HP_FM  = X1 .* HighPass_dft( length( X1 ) )';

% Display the filtered transform
figure(2);
plot( f(1:end/2),  abs( HP_FM(1:end/2)));
title('Fourier Transform of the filtered version');
xlabel( 'Frequency (KHz)');
ylabel( 'Magnitude (unknown) ');

% Generate 8192 samples of x(t) at a sampling rate of 400K (2.5 u seconds).
x2 = cos( 2*pi*(160/400)*n ) + 0.5 * sin( 2*pi*(180/400)*n );

% Reconstruct the Original Signal
Xr = 4*ifft(HP_FM);

% Compare the reconstructed signal and the original signal sampled at 400K
figure(3);
plot( x2, 'r:');
hold on;
plot( Xr, 'b-');
title('Comparison of the reconstructed signal and the original signal sampled at 400K');
xlabel( 'Frequency (Hertz)');
ylabel( 'Magnitude (unknown) ');


