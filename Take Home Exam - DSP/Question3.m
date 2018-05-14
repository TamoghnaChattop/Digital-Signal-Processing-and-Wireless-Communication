% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
% TITLE: Spectral Analysis 
%
% Purpose: To do spectral analysis on the signal test given in the MatLab
% file provided.
% 
% 
% Date created: 08/01/2016 Author: Tamoghna Chattopadhyay
% Date modified: rev1 - 08/02/2016
% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

% Load the given file
load('DFT_Final.mat');

% Find the frequency of the large main component by iteration
N = 256;
TEST = fft(test,N);
[TMax,NMax] = max(abs(TEST(1:end/2)));
freq = 100e3*(NMax-1)/N;

N = 2*N;
TEST = fft(test,N);
[TMax,NMax] = max(abs(TEST(1:end/2)));
freq = 100e3*(NMax-1)/N;

N = 2*N;
TEST = fft(test,N);
[TMax,NMax] = max(abs(TEST(1:end/2)));
freq = 100e3*(NMax-1)/N;

N = 2*N;
TEST = fft(test,N);
[TMax,NMax] = max(abs(TEST(1:end/2)));
freq = 100e3*(NMax-1)/N;

N = 2*N;
TEST = fft(test,N);
[TMax,NMax] = max(abs(TEST(1:end/2)));
freq = 100e3*(NMax-1)/N

% Plot the fourier transform of the signal
figure(1);
plot( abs(TEST));
title('Fourier Transform of original Signal');
xlabel( 'Frequency (Hertz)');
ylabel( 'Magnitude (unknown) ');

% Subtract out the maximum component
n=0:length(test)-1;
Sub = test - real((1/length(test))*(TMax*exp(i*2*pi*(NMax-1)/N*n))) + ...
    conj(TMax)*exp(-i*2*pi*(NMax-1)/N*n);

% Compute its fourier transform
SUB = fft(Sub,N);

% Plot the output of the fourier transform of the subtraction
figure(2);
plot( abs(SUB));
title('Fourier Transform of Signal with subtracted component ');
xlabel( 'Frequency (Hertz)');
ylabel( 'Magnitude (unknown) ');

% Construct a normalized frequency array ( 0 to 1 matches 0 to fs/2 )
f = [0:length(TEST)-1]/length(TEST);

% Apply Highpass Filter to the transform
BP_FM  = TEST .* BandPass_dft( length( TEST ) );

% Display the filtered transform
figure(3);
plot( f(1:end/2),  abs( BP_FM(1:end/2)));
title('Fourier Transform of the filtered version');
xlabel( 'Frequency (KHz)');
ylabel( 'Magnitude (unknown) ');

