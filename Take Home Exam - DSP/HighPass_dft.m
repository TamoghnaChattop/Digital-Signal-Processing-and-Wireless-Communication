function H = HighPass_dft( N ); 
%
% H = HighPass_dft( N );
% 
% This program generates a High Pass filter for application to the DFT of a signal.
% The output is an array that is point by point multiplied
% with the dft of the signal.
% The input parameter N is then length of the signal.

n1 = floor( 0.35 * N );
n2 = floor( 0.3875 * N );
n3 = floor( 0.5 * N + 1 );

H = zeros( 1, N );
H( n1:n2 ) = [0:1/(n2-n1):1]; % Up to one 
H( n2+1:n3 ) = H( n2+1:n3 ) + 1; % Set At one 
H( (N/2+2):N ) = H(N/2:-1:2); % Conjugate Symmetry 
return;