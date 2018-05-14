% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
% TITLE: Section II - Filter Design
%
% Purpose: To design a set of FIR filters that matches the
% specifications.
% Date created: 07/25/2016 Author: Tamoghna Chattopadhyay
% Date modified: rev1 - 07/25/2016
% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

% Filter Specifications

% Lowpass Filter
lp = firls_hamming_search( [0 5.15/22.5 5.95/22.5 1], [ 1 1 0 0], 0.1 );
figure(1);
plot(lp);
title('Impulse Response of Low Pass');
xlabel('Length of filter');
ylabel('Response of filter');
grid on;

% Bandpass Filter
bp = firls_hamming_search( [0 5.15/22.5 5.95/22.5 16.15/22.5 16.95/22.5 1], [ 0 0 1 1 0 0], 0.1 );
figure(2);
plot(bp);
title('Impulse Response of Band Pass');
xlabel('Length of filter');
ylabel('Response of filter');
grid on;

% Highpass Filter
hp = firls_hamming_search( [0 16.15/22.5 16.95/22.5 1], [ 0 0 1 1 ], 0.1 );
figure(3);
plot(hp);
title('Impulse Response of High Pass');
xlabel('Length of filter');
ylabel('Response of filter');
grid on;

% Create Frequency Response of each filter. 
w = [0:pi/256:pi];
lpfr = freqz( lp, 1, w );
bpfr = freqz( bp, 1, w );
hpfr = freqz( hp, 1, w );

% Produce a plot of the frequency responses overlaid on one another.
figure(4); 
subplot( 311),plot( w, abs(lpfr),[0 0 0.7 0.7 0],[0.9 1 1 0.9 0.9],'r-',...
    [0.85 0.85 3.2],[0.1 0.03 0.03],'r-'); 
title( 'Frequency Response of Low Pass' );
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
subplot( 312),plot( w, abs(bpfr), [0 0.65 0.65], [0.03 0.03 0.1],'r-',...
    [0.75 0.75 2.3 2.3 0.75],[0.9 1 1 0.9 0.9],'r-',...
    [2.4 2.4 3.15],[0.1 0.03 0.03],'r-'); 
title( 'Frequency Response of Band Pass' ); 
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
subplot( 313),plot( w, abs(hpfr), [0 2.2 2.2], [0.03 0.03 0.1], 'r-',...
    [2.35 2.35 3.2 3.2 2.35],[0.9 1 1 0.9 0.9], 'r-'); 
title( 'Frequency Response of High Pass' );
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');

% Plot the pole zero plot
figure(5);
zplane( lp, 1 );
title ('Pole Zero Plot - Low Pass Filter');

figure(6);
zplane( bp, 1 );
title ('Pole Zero Plot - Band Pass Filter');

figure(7);
zplane( hp, 1 );
title ('Pole Zero Plot - High Pass Filter');
