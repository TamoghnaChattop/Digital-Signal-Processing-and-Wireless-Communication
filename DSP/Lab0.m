% Clear Workspace
close all
clear

% Generate x data
x = [-2:0.01:2];

% Create exp and the approximations
y = exp(x);
y1 = 1 + x;
y2 = ( 0.5 + x + 1 ).*x + 1;

% Plot results 
plot( x, y, x, y1, x, y2 );
title( 'Comparing exp and approximations' );
xlabel( 'Input (unknown)' );
ylabel( 'Output (unknown)' );
legend( 'exp', 'First Order', 'Second Order' );
grid 

% Compute Errors

ARE1 = abs( y - y1 )./abs( y );
ARE2 = abs( y - y2 )./abs( y );

% Plot Error 
figure
plot( x, ARE1, 'b-', x, ARE2, 'r--' );
title( 'Error between exp and two approximations' );
xlabel( 'Input (unknown)' );
ylabel( 'Output (unknown)' );
legend( 'First Order', 'Second Order' );
grid 

