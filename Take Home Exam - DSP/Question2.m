% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -
% TITLE: Overlap Add 
%
% Purpose: To employ Overlap Add in order to process a long signal. A FIR
% bandpass filter with cosine times a hamming window is utilised.
% 
% 
% Date created: 08/01/2016 Author: Tamoghna Chattopadhyay
% Date modified: rev1 - 08/02/2016
% -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

% Load the given file
load('DFT_Final.mat');

% Plot the original signal
figure(1);
plot( signal ); % Plot the spectrum
title('Original signal in given MatLab file');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');

% Define the lengths of filter and transform, i.e. 1024 point data
H_Length = length(h);
F_Length = 1024

% Find the fourier transform
H = fft( h, 1024 );

% Filter the data using Overlap-Add
n = 0;
m = 1; 
figure(2); 
for k = 1:4   
    SIG = fft( signal( m:m+F_Length-H_Length-1 ),F_Length );    
    y = ifft( SIG.*H );    
    if( k==1 )      
        z = y;      
        n = F_Length-H_Length; 
    else
        z = [z(1:n)  z(n+1:n+H_Length)+y(1:H_Length) y(H_Length+1:F_Length)];      
        n = n + F_Length-H_Length;            
        end;   
    m = m + F_Length-H_Length;
end;

% Plot the result of filtering
figure(2);
plot( real( z ) );
title('Overlap-Add Method of Filter Data');
xlabel( 'Frequency (Hertz)');
ylabel( 'Magnitude (unknown) ');