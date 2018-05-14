% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
% TITLE: Basic Matlab IIR Filter Designs
%
% Purpose: To develop an understanding of the basics calls used to design and analyze filters in MatLab.  
%
% Date created: 07/14/2016 Author: Tamoghna Chattopadhyay
% Date modified: rev1 - 07/14/2016
% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -

% Filter Specifications
% Butterworth Bandpass Filter
[ nbwbp, wbwbp ] = buttord( [ 1/20 9.5/20 ], [ 0.5/20 12/20 ], -0.25, -50 )

% Chebyshev Bandpass Filter
[ nchbybp, wchbybp ] = cheb1ord( [ 1/20 9.5/20 ], [ 0.5/20 12/20 ], -0.25, -50 )

% Butterworth Highpass Filter
[ nbwhp, wbwhp ] = buttord( 12/20, 9.5/20, -0.25, -50 )

% Chebyshev Highpass Filter
[ nchbyhp, wchbyhp ] = cheb1ord( 12/20, 9.5/20, -0.25, -50 )

%Creating array of coefficients for Bandpass Butterworth Filter
[ bwbpnz, bwbpdz ] = butter( nbwbp, wbwbp);

%Creating array of coefficients for Highpass Butterworth Filter
[ bwhpnz, bwhpdz ] = butter( nbwhp, wbwhp);

%Creating array of coefficients for Bandpass Chebyshev Filter
[ chbybpnz, chbybpdz ] = cheby1( nchbybp, 0.25, wchbybp );

%Creating array of coefficients for Highpass Chebyshev Filter
[ chbyhpnz, chbyhpdz ] = cheby1( nchbyhp, 0.25, wchbyhp );

% Generating Chirp Signal
x = cos( pi/4096 * [0:4095].^2);

% Producing Plots of frequency response

% Bandpass Chebyshev Filter
y_bp = freqz ( chbybpnz, chbybpdz, 512);
figure(1);
plot(abs(y_bp));
title('Band-Pass Filter - Magnitude for Chebyshev Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;
figure(2);
zplane( chbybpnz, chbybpdz ); 
title( 'Band Pass for Chebyshev Filter' );

% Highpass Chebyshev Filter
y_hp = freqz ( chbyhpnz, chbyhpdz, 512);
figure(3);
plot(abs(y_hp));
title('High-Pass Filter - Magnitude for Chebyshev Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;
figure(4);
zplane( chbyhpnz, chbyhpdz ); 
title( 'High Pass for Chebyshev Filter' );

% Bandpass Butterworth Filter
a_bp = freqz ( bwbpnz, bwbpdz, 512);
figure(5);
plot(abs(a_bp));
title('Band-Pass Filter - Magnitude for Butterworth Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;
figure(6);
zplane( bwbpnz, bwbpdz ); 
title( 'Band Pass for Butterworth Filter' );

% Highpass Butterworth Filter
a_hp = freqz ( bwhpnz, bwhpdz, 512);
figure(7);
plot(abs(a_hp));
title('High-Pass Filter - Magnitude for Butterworth Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;
figure(8);
zplane( bwhpnz, bwhpdz ); 
title( 'High Pass for Butterworth Filter' );

% Filter the chirp signal using Chebyshev bandpass filter
c_bp = filter ( chbybpnz, chbybpdz, x);
figure(9);
plot(c_bp);
title('Band-Pass Filter - Magnitude for Chebyshev Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;

% Filter the chirp signal using Chebyshev highpass filter
c_hp = filter ( chbyhpnz, chbyhpdz, x);
figure(10);
plot(c_hp);
title('High-Pass Filter - Magnitude for Chebyshev Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;

% Filter the chirp signal using Butterworth bandpass filter
b_bp = filter ( bwbpnz, bwbpdz, x);
figure(11);
plot(b_bp);
title('Band-Pass Filter - Magnitude for Butterworth Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;

% Filter the chirp signal using Butterworth highpass filter
b_hp = filter ( bwhpnz, bwhpdz, x);
figure(12);
plot(b_hp);
title('High-Pass Filter - Magnitude for Butterworth Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');
grid on;




