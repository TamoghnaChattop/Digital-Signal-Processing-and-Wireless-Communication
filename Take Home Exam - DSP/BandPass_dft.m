function H = BandPass_dft( N ); 
% 
% H = BandPass_dft( N ); 
% 
% This program generates a Band Pass filter for application to the DFT of a signal. 
% The output is an array that is point by point multiplied 
% with the dft of the signal. 

% The input parameter N is then length of the signal.

n1 = floor( 0.1 * N );
n2 = floor( 0.15 * N );
n3 = floor( 0.25 * N ); 
n4 = floor( 0.3 * N );
H = zeros( 1, N );
H( n1:n2 ) = [0:1/(n2-n1):1]; % Up to one
H( n2+1:n3-1 ) = H( n2+1:n3-1 ) + 1; % Set At one 
H( n3:n4 ) = [1:-1/(n4-n3):0]; % Down to zero
H( (N/2+2):N ) = H(N/2:-1:2); % Conjugate Symmetry 
return;