% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
% TITLE: Section III - Decimation and Frequency shifting.
%
% Purpose: To plot a signal in the file fexam.mat and it's spectrum
%
% Date created: 07/25/2016 Author: Tamoghna Chattopadhyay
% Date modified: rev1 - 07/25/2016
% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

load('fexam.mat');
sound(sig,44100);
SIG = fft(sig); % Computes the Fourier Transform of sig 
figure(1);
plot( abs( SIG ) ); % Plot the spectrum
title('Spectrum of signal in fexam.mat');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');

N=length(SIG);
figure(2);
plot(([0:N/2 - 1]/N)*44.1e3,abs(SIG(1:N/2)));
title('Spectrum of half the bandwidth for signal in fexam.mat');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');