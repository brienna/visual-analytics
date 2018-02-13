% Find max to scale all plots accurately
maxLA = max(LinearAcceleration(:));
maxRA = max(RotationalAcceleration(:));
maxRV = max(RotationalVelocity(:));

% Find how many instances there are (all 3 matrices are the same size)
N = size(LinearAcceleration, 1);

for i = 1:N
    figure; % create a new figure
    subplot( 3, 1, 1 );
    hold on;
    plot( TimeLinear, LinearAcceleration( i, :), '-r' );
    ylim([0 maxLA]);
    title( ['Linear Acceleration (LA) of Instance ' num2str(i)]);
    xlabel( 'Time (ms)' );
    ylabel( 'LA (g)' );
    subplot( 3, 1, 2 );
    hold on;
    plot( TimeRotational, RotationalVelocity( i, :), '-r' );
    ylim([0 maxRV]);
    title( ['Rotational Velocity (RV) of Instance ' num2str(i)]);
    xlabel( 'Time (ms)' );
    ylabel( 'RV (rad/sec)' );
    subplot( 3, 1, 3 );
    hold on;
    plot( TimeRotational, RotationalAcceleration( i, :), '-r');
    ylim([0 maxRA]);
    title( ['Rotational Acceleration (RA) of Instance ' num2str(i)]);
    xlabel( 'Time (ms)' );
    ylabel( 'RA (rad/sec^2)' );
    print(gcf, fullfile( 'waveform_comparisons/', [ 'Instance ' num2str( i ) '.png' ] ), '-dpng', '-opengl');
    close all; % close any open figures
end % i loop