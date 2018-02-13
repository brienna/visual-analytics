% Load the dataset
load('waveforms.mat');

% Find number of instances in any one matrix
% Note: All 3 matrices have the same number of instances
N = size(LinearAcceleration, 1);

% Create 65x1 matrices of zeroes for each feature 
MLA = zeros(65, 1); % minimum linear acceleration
ALA = zeros(65, 1); % average linear acceleration
PLA = zeros(65, 1); % peak linear acceleration
MRV = zeros(65, 1); % minimum rotational velocity
ARV = zeros(65, 1); % average rotational velocity
PRV = zeros(65, 1); % peak rotational velocity
MRA = zeros(65, 1); % mininmum rotational acceleration
ARA = zeros(65, 1); % average rotational acceleration
PRA = zeros(65, 1); % peak rotational acceleration

% Loop over the three waveform matrices and compute 
% features of each individual waveform, saving the results 
% to the pre-allocated feature matrices
for i = 1:N
    MLA(i, 1) = min(LinearAcceleration(i,:));
    PLA(i, 1) = max(LinearAcceleration(i, :));
    ALA(i, 1) = mean(LinearAcceleration(i, :));
end % i loop

for i = 1:N
    MRA(i, 1) = min(RotationalAcceleration(i, :));
    PRA(i, 1) = max(RotationalAcceleration(i, :));
    ARA(i, 1) = mean(RotationalAcceleration(i, :));
end % i loop

for i = 1:N
    MRV(i, 1) = min(RotationalVelocity(i, :));
    PRV(i, 1) = max(RotationalVelocity(i, :));
    ARV(i, 1) = mean(RotationalVelocity(i, :));
end % i loop


% Plot each feature unsorted and sorted on their own plot

% ARA unsorted
plot(ARA, '.r'); 
title('Average Rotational Acceleration of All Waveforms');
xlabel('Waveform Number');
ylabel('Rotational Acceleration (rad/sec^2)');
print(gcf, fullfile('features/', 'ARA.png'), '-dpng', '-opengl');
% ARA sorted
% Note: ARA_B contains sorted numbers, ARA_I contains corresponding indices of ARA
[ARA_B, ARA_I] = sort(ARA);
plot(ARA_B, '.r');
title('Sorted Average Rotational Acceleration of All Waveforms');
xlabel('Waveform Number');
ylabel('Rotational Acceleration (rad/sec^2)');
print(gcf, fullfile('features/', 'ARA_sorted.png'), '-dpng', '-opengl');

% MLA unsorted
plot(MLA, '.r'); 
title('Minimum Linear Acceleration of All Waveforms');
xlabel('Waveform Number');
ylabel('Linear Acceleration (g)');
print(gcf, fullfile('features/', 'MLA.png'), '-dpng', '-opengl');
% MLA sorted
[MLA_B, MLA_I] = sort(MLA);
plot(MLA_B, '.r');
title('Sorted Minimum Linear Acceleration of All Waveforms');
xlabel('Waveform Number');
ylabel('Linear Acceleration (g)');
print(gcf, fullfile('features/', 'MLA_sorted.png'), '-dpng', '-opengl');

% ALA unsorted
plot(ALA, '.r');
title('Average Linear Acceleration of All Waveforms');
xlabel('Waveform Number');
ylabel('Linear Acceleration (g)');
print(gcf, fullfile('features/', 'ALA.png'), '-dpng', '-opengl');
% ALA sorted
[ALA_B, ALA_I] = sort(ALA);
plot(ALA_B, '.r');
title('Sorted Average Linear Acceleration of All Waveforms');
xlabel('Waveform Number');
ylabel('Linear Acceleration (g)');
print(gcf, fullfile('features/', 'ALA_sorted.png'), '-dpng', '-opengl');

% PLA unsorted
plot(PLA, '.r');
title('Peak Linear Acceleration of All Waveforms');
xlabel('Waveform Number');
ylabel('Linear Acceleration (g)');
print(gcf, fullfile('features/', 'PLA.png'), '-dpng', '-opengl');
% PLA sorted
[PLA_B, PLA_I] = sort(PLA);
plot(PLA_B, '.r');
title('Sorted Peak Linear Acceleration of All Waveforms');
xlabel('Waveform Number');
ylabel('Linear Acceleration (g)');
print(gcf, fullfile('features/', 'PLA_sorted.png'), '-dpng', '-opengl');

% MRV unsorted
plot(MRV, '.r');
title('Minimum Rotational Velocity of All Waveforms');
xlabel('Waveform Number');
ylabel('Rotational Velocity (rad/sec)');
print(gcf, fullfile('features/', 'MRV.png'), '-dpng', '-opengl');
% MRV sorted
[MRV_B, MRV_I] = sort(MRV);
plot(MRV_B, '.r');
title('Sorted Minimum Rotational Velocity of All Waveforms');
xlabel('Waveform Number');
ylabel('Rotational Velocity (rad/sec)');
print(gcf, fullfile('features/', 'MRV_sorted.png'), '-dpng', '-opengl');

% ARV unsorted
plot(ARV, '.r');
title('Average Rotational Velocity of All Waveforms');
xlabel('Waveform Number');
ylabel('Rotational Velocity (rad/sec)');
print(gcf, fullfile('features/', 'ARV.png'), '-dpng', '-opengl');
% ARV sorted
[ARV_B, ARV_I] = sort(ARV);
plot(ARV_B, '.r');
title('Sorted Average Rotational Velocity of All Waveforms');
xlabel('Waveform Number');
ylabel('Rotational Velocity (rad/sec)');
print(gcf, fullfile('features/', 'ARV_sorted.png'), '-dpng', '-opengl');

% PRV unsorted
plot(PRV, '.r');
title('Peak Rotational Velocity of All Waveforms');
xlabel('Waveform Number');
ylabel('Rotational Velocity (rad/sec)');
print(gcf, fullfile('features/', 'PRV.png'), '-dpng', '-opengl');
% PRV sorted
[PRV_B, PRV_I] = sort(PRV);
plot(PRV_B, '.r');
title('Sorted Peak Rotational Velocity of All Waveforms');
xlabel('Waveform Number');
ylabel('Rotational Velocity (rad/sec)');
print(gcf, fullfile('features/', 'PRV_sorted.png'), '-dpng', '-opengl');

% MRA unsorted
plot(MRA, '.r');
title('Mimimum Rotational Acceleration of All Waveforms');
xlabel('Waveform Number');
ylabel('Rotational Acceleration (rad/sec^2)');
print(gcf, fullfile('features/', 'MRA.png'), '-dpng', '-opengl');
% MRA sorted
[MRA_B, MRA_I] = sort(MRA);
plot(MRA_B, '.r');
title('Sorted Mimimum Rotational Acceleration of All Waveforms');
xlabel('Waveform Number');
ylabel('Rotational Acceleration (rad/sec^2)');
print(gcf, fullfile('features/', 'MRA_sorted.png'), '-dpng', '-opengl');

% PRA unsorted
plot(PRA, '.r');
title('Peak Rotational Acceleration of All Waveforms');
xlabel('Waveform Number');
ylabel('Rotational Acceleration (rad/sec^2)');
print(gcf, fullfile('features/', 'PRA.png'), '-dpng', '-opengl');
% PRA sorted
[PRA_B, PRA_I] = sort(PRA);
plot(PRA_B, '.r');
title('Sorted Peak Rotational Acceleration of All Waveforms');
xlabel('Waveform Number');
ylabel('Rotational Acceleration (rad/sec^2)');
print(gcf, fullfile('features/', 'PRA_sorted.png'), '-dpng', '-opengl');


% Determine indexes/values of the five "different" data instances
% Note: Used sorted PLA, ARV, PRA graphs to see that last five stand out
PLA_I(N-5:N)
PLA_B(N-5:N)

PRA_I(N-5:N)
PRA_B(N-5:N)

ARV_I(N-4:N); % doesn't have the same 5 instances as the other 2
ARV_B(N-4:N); 

% Visualize an example of a normal instance vs 
% a "different" instance on the same plot
close all; % close any open figures
figure; % create a new figure
subplot( 2, 1, 1 );
hold on;
p1 = plot(TimeRotational, RotationalAcceleration(12, :), '-b');
p2 = plot(TimeRotational, RotationalAcceleration(20, :), '-r');
title('Rotational Acceleration of Instances 12 and 20');
xlabel( 'Time (ms)' );
ylabel( 'RA (rad/sec^2)' );
legend('Instance 12', 'Instance 20');
subplot(2, 1, 2);
hold on;
p3 = plot(TimeLinear, LinearAcceleration(12, :), '-b');
p4 = plot(TimeLinear, LinearAcceleration(20, :), '-r');
title('Linear Acceleration of Instances 12 and 20');
xlabel( 'Time (ms)' );
ylabel( 'Linear Acceleration (g)' );
print(gcf, fullfile('', 'Instance12_vs_20.png'), '-dpng', '-opengl');
close all;

% Cluster graph to clearly depict difference between the instances
plot(PRA, PLA, '*');
xlabel( 'Peak Rotational Acceleration (rad/sec^2)' );
ylabel('Peak Linear Acceleration (g)');
title('Peak Rotational and Linear Accelerations of All Waveforms');
print(gcf, fullfile('', 'PRA_PLA_cluster.png'), '-dpng', '-opengl');
