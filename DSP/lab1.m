% Clear Workspace
close all
clear

% Generate test signal
x = cos( pi/8192 * [0:8191].^2 );

% Filter Signal
y = ThreePointMA( x );

% Write to CSV 
csvwrite( 'ChirpAndThreePoint.csv', [x; y]');

% Plot Results
figure(1);
subplot(211),plot(0:8191, x);
title( 'Test Signal' );
xlabel( 'Samples' );
ylabel( 'Amplitude' );

subplot(2,1,2),plot(0:8191, y, 'b');
title( 'Filter Signal' );
xlabel( 'Samples' );
ylabel( 'Frequency Response' );
