% Define constants
fs = 44100; % Sampling frequency (Hz)
t = 0:1/fs:0.5; % Time vector for half a second
f0 = 440; % Base frequency for DO
alpha = 2; % Alpha value for frequency calculation

% Generate the four signals for DO, RE, MI, and FA
n_values = [-9, -7, -5, -4]; % Corresponding values for n
notes = {'DO', 'RE', 'MI', 'FA'};
x = cell(1, 4); % Create a cell array to store signals

for i = 1:4
    fn = f0 * (alpha ^(n_values(i)/12)); % Calculate the frequency
    x{i} = cos(2 * pi * fn * t); % Generate the signal
end

% Plot the signals
for i = 1:4
    subplot(2, 2, i);
    plot(t, x{i});
    title(['Signal for ' notes{i}]);
    xlabel('Time (s)');
    ylabel('Amplitude');
end

% Play the signals sequentially
combined_signal = [x{1}, x{2}, x{3}, x{4}];
sound(combined_signal, fs);

% Save the combined signal as an audio file
audiowrite('combined_notes.wav', combined_signal, fs);