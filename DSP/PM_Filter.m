% Create Design for PM Filter
W_pm = firpm ( 72, [ 0 1/5 1.25/5 2.5/5 2.8/5 1 ], [ 0 0 0.975 0.975 0 0 ], [ 2.5 1 2.5 ]);

% Test response at all the "critical" frequencies
[ H, f ] = freqz( W_pm, 1, 1024, 10000);


% Plot magnitude results from PM design.
figure(1);
plot( f, abs(H), 'b-', [ 0 1000 1000 ], [ 0.01 0.01 0.05 ], 'r:', ...
    [ 1250 1250 2500 2500 1250 ], [ 1 0.95 0.95 1 1 ], 'r:', ...
    [ 2800 2800 5000 ], [ 0.05 0.01 0.01 ], 'r:' );
title ('Magnitude Response of the PM Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Magnitude (unknown) ');

% Plot phase results from PM design.
figure(2);
plot( f, angle(H));
title ('Phase Response of the PM Filter');
xlabel (' Frequency in Hertz ' );
ylabel (' Phase ');

% Plot the pole zero plot
figure(3);
zplane( W_pm, 1 );
title ('Pole Zero Plot');

% Plot the impulse response
figure(4);
plot( W_pm );
title ( ' Filter Design for PM Filter ');
xlabel (' Length of filter ');
ylabel (' Response of filter ');
