% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
% TITLE: Section III - Decimation and Frequency shifting.
%
% Purpose: Apply IIR Filters from Section II to signal in fexam.mat
%
% Date created: 07/25/2016 Author: Tamoghna Chattopadhyay
% Date modified: rev1 - 07/25/2016
% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

% Filter Specifications
% Butterworth Bandpass Filter
[ nbwbp, wbwbp ] = buttord( [ 5.95/22.05 16.15/22.05 ], [ 5.15/22.5 16.95/22.5 ], -1, -30 )

% Butterworth Highpass Filter
[ nbwhp, wbwhp ] = buttord( 16.95/22.05, 16.15/22.5, -1, -30 )

% Butterworth Lowpass Filter
[ nbwlp, wbwlp ] = buttord( 5.15/22.5, 5.95/22.5, -1, -30 )

%Creating array of coefficients for Bandpass Butterworth Filter
[ bwbpnz, bwbpdz ] = butter( nbwbp, wbwbp);

%Creating array of coefficients for Highpass Butterworth Filter
[ bwhpnz, bwhpdz ] = butter( nbwhp, wbwhp, 'high');

%Creating array of coefficients for Lowpass Butterworth Filter
[ bwlpnz, bwlpdz ] = butter( nbwlp, wbwlp);

%Load the signal in fexam.mat
load('fexam.mat');
sound(sig,44100);
pause;
SIG = fft(sig); % Computes the Fourier Transform of sig 

% Filter the signal using Butterworth Highpass Hilter
b_hp = filter ( bwhpnz, bwhpdz, sig);
figure(1);
plot(b_hp);
title('High-Pass Filter - Magnitude for Butterworth Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;

% Filter the signal using Butterworth Lowpass Hilter
b_lp = filter ( bwlpnz, bwlpdz, sig);
figure(2);
plot(b_lp);
title('Low-Pass Filter - Magnitude for Butterworth Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;

% Filter the signal using Butterworth Bandpass Hilter
b_bp = filter ( bwbpnz, bwbpdz, sig);
figure(3);
plot(b_bp);
title('Band-Pass Filter - Magnitude for Butterworth Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;

%Decimate signals to one-fourth sampling rates
Dec_b_hp=b_hp(1:4:end);
Dec_b_lp=b_lp(1:4:end);
Dec_b_bp=b_bp(1:4:end);

%Plot the output signal after decimation
%High Pass Filter output
figure(4);
plot(Dec_b_hp);
title('High-Pass Filter - Magnitude for Butterworth Filter for Decimated Signal');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;

%Low Pass Filter output
figure(5);
plot(Dec_b_lp);
title('Low-Pass Filter - Magnitude for Butterworth Filter for Decimated Signal');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;

%Band Pass Filter output
figure(6);
plot(Dec_b_bp);
title('Band-Pass Filter - Magnitude for Butterworth Filter for Decimated Signal');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;

%Fourier Transforms of filtered signals
B_HP = fft(Dec_b_hp);
B_LP = fft(Dec_b_lp);
B_BP = fft(Dec_b_bp);
%Plot the Spectrum
figure(7);
subplot( 311),plot( abs( B_HP ) );
title('Spectrum of the signal passed through High Pass Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
subplot( 312),plot( abs( B_LP ) );
title('Spectrum of the signal passed through Low Pass Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
subplot( 313),plot( abs( B_BP ) );
title('Spectrum of the signal passed through Band Pass Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');

%Play the signals as sound 
sound(Dec_b_hp,11.025e3);
pause;
sound(Dec_b_lp,11.025e3);
pause;
sound(Dec_b_bp,11.025e3);
pause;

