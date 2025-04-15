% Time-domain response to sine

% Component values
R = 0.5;   % Resistance in ohms
C = 0.1;   % Capacitance in farads
L = 0.1;   % Inductance in henries

% Transfer function
num = [R*C, 0];  % Numerator of transfer function
den = [L*C, R*C, 1];  % Denominator of transfer function
G = tf(num, den);  % Transfer function representation

% Input sine signal parameters
fu = 20;  % Signal frequency in Hz
wu = 2*pi*fu;  % Signal frequency in radians per second
fs = 2000;  % Sampling frequency in Hz
tiv = 1/fs;  % Time interval between samples
t = 0:tiv:(2-tiv);  % Time intervals for 2 seconds

% Sine input signal
u = sin(wu*t);  % Input signal data set (sine wave)

% Compute system output using lsim
[y, ty] = lsim(G, u, t);  % System response to input signal

% Plot the output signal
figure;
plot(t, y, 'k');  % Plot the output signal in black
xlabel('Time (seconds)');
ylabel('Amplitude');
title('Time-domain response to sine wave input');
grid on;
