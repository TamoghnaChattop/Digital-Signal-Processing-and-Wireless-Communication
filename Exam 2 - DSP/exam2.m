% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
% TITLE: Section II - Filter Design
%
% Purpose: To design a set of Butterworth IIR filters that matches the
% specifications.
% Date created: 07/14/2016 Author: Tamoghna Chattopadhyay
% Date modified: rev1 - 07/18/2016
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

% Producing Plots of frequency response

% Bandpass Butterworth Filter
[a_bp,f1] = freqz ( bwbpnz, bwbpdz, 1024,44100);
figure(1);
plot(f,abs(a_bp),'k',...
    [0 5150 5150], [0.03 0.03 0.1],'r-',...
    [5950 5950 16150 16150 5950],[0.9 1 1 0.9 0.9],'r-',...
    [22050 16950 16950],[0.03 0.03 0.1],'r-');
title('Band-Pass Filter - Magnitude for Butterworth Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;
figure(2);
zplane( bwbpnz, bwbpdz ); 
title( 'Band Pass for Butterworth Filter' );

% Highpass Butterworth Filter
[a_hp,f2] = freqz ( bwhpnz, bwhpdz, 1024,44100);
figure(3);
plot(f2,abs(a_hp),'k',...
    [0 16150 16150],[0.03 0.03 0.1],'r-',...
    [16950 16950 22050 22050 16950],[0.9 1 1 0.9 0.9],'r-');
title('High-Pass Filter - Magnitude for Butterworth Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;
figure(4);
zplane( bwhpnz, bwhpdz ); 
title( 'High Pass for Butterworth Filter' );

% Lowpass Butterworth Filter
[a_lp,f3] = freqz ( bwlpnz, bwlpdz, 1024,44100);
figure(5);
plot(f3,abs(a_lp),'k',...
    [0 5150 5150 0], [1 1 0.9 0.9], 'r-',...
    [22050 5950 5950], [0.03 0.03 0.1], 'r-' );
title('Low-Pass Filter - Magnitude for Butterworth Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;
figure(6);
zplane( bwlpnz, bwlpdz ); 
title( 'Low Pass for Butterworth Filter' );

% Generate impulse response of system.
d = zeros( 2048, 1 ); 
d(64) = 1.0;

llp = filter( bwlpnz, bwlpdz, d );
hlp = filter( bwhpnz, bwhpdz, d );
blp = filter( bwbpnz, bwbpdz, d );

% Produce a plot of the frequency responses overlaid on one another.
figure(7); 
subplot( 311),plot( llp ); 
title( 'Impulse Response of Low Pass' ); 
xlabel('Length of filter');
ylabel('Response of filter');
subplot( 312),plot( blp ); 
title( 'Impulse Response of Band Pass' ); 
xlabel('Length of filter');
ylabel('Response of filter');
subplot( 313),plot( hlp ); 
title( 'Impulse Response of High Pass' );
xlabel('Length of filter');
ylabel('Response of filter');