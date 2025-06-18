clc;
clear;
close all;

r_max = 1;  % Max radar range (normalized)
target_angles_deg = [45, 120, 250];
target_ranges = [0.6, 0.8, 0.7];

% Convert angles to radians
target_angles = deg2rad(target_angles_deg);

% Create Radar UI
fig = figure('Color','k', 'Name', 'Realistic Radar Simulation');
ax = polaraxes('ThetaColor','g', 'RColor','g', 'Color','k', ...
    'ThetaTick', 0:30:330, 'RTick', []);
rlim([0 r_max]);
ax.ThetaZeroLocation = 'top';
ax.ThetaDir = 'clockwise';
hold on;

% Radar Grid: draw concentric circles manually
num_rings = 5;
for r = linspace(0.2, 1.0, num_rings)
    theta_ring = linspace(0, 2*pi, 500);
    polarplot(theta_ring, r*ones(size(theta_ring)), 'Color', [0 1 0 0.2]); % semi-transparent green
end

% Plot initial targets (red blips)
target_plots = gobjects(size(target_angles));
for i = 1:length(target_angles)
    target_plots(i) = polarplot(target_angles(i), target_ranges(i), 'ro', 'MarkerSize', 10, 'LineWidth', 1.5);
end

% Prepare radar sweep line
sweep_line = polarplot([0 0], [0 r_max], 'g', 'LineWidth', 2);

% Prepare beep sound (1 kHz)
fs = 8000;
t = 0:1/fs:0.1;
beep = sin(2*pi*1000*t);
player = audioplayer(beep, fs);  % Use audioplayer for low-latency playback

% Optional: show radar label
text(-1.2, 1.1, '', 'Color', 'green', 'FontSize', 14, 'FontWeight', 'bold');


while isvalid(fig)
    for angle = 0:1:359
        theta = deg2rad(angle);
        sweep_line.ThetaData = [theta theta];
        drawnow;

        % Fade old targets (restore to red)
        for i = 1:length(target_angles)
            set(target_plots(i), 'Marker', 'o', 'MarkerSize', 10, 'Color', 'r');
        end

        % Check for hits
        for i = 1:length(target_angles)
            angle_diff = abs(wrapTo360(rad2deg(theta) - rad2deg(target_angles(i))));
            if angle_diff < 1
                set(target_plots(i), 'Marker', 'o', 'MarkerSize', 14, 'Color', 'g');  % Highlight
                play(player);  % Instant sound
            end
        end

        pause(0.01);  % Sweep speed
    end
end