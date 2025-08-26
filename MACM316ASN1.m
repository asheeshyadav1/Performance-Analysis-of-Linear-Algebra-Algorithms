% Part A %
% Define symbolic variable
syms h;

% Define the function F(h)
f = @(h) ((exp(-h^2)) - 1) / (h^2);

% Get the limit of F(h) as h -> 0
L = double(limit((exp(-h^2) - 1) / (h^2), h, 0));

% Define h values 
x = [0:0.001:1]; 
y = (exp(-x.^2) - 1) ./ (x.^2); 

% avoids div by 0
y(1) = L; 

% log plot for F(h) vs h
figure(1);
semilogx(x(2:end), y(2:end), 'g', 'LineWidth', 1.1); 
xlabel('h (log scale)', 'FontWeight', 'bold');
ylabel('F(h)', 'FontWeight', 'bold');
title('Log Scale Graph of F(h) vs h (0 to 1)', 'FontWeight', 'bold');
grid on;

% Part B %

% Define h values
x1 = logspace(-8, 0, 500);
y1 = abs((exp(-x_b.^2) - 1) ./ (x_b.^2) - L);

% Plot |F(h)-L| vs h
figure(2);
plot(x1, y1, 'b', 'LineWidth', 1.1);
xlabel('h', 'FontWeight', 'bold');
ylabel('|F(h)-L|', 'FontWeight', 'bold');
title('Graph of |F(h)-L| vs h', 'FontWeight', 'bold');
grid on;
set(gca, 'XScale', 'log', 'YScale', 'log'); % Log-log scale

% Plot log(|F(h)-L|) vs log(h)
xLog = log(x1);
yLog = log(y1);
figure(3);
plot(xLog, yLog, 'r', 'LineWidth', 1.1);
xlabel('log(h)', 'FontWeight', 'bold');
ylabel('log(|F(h)-L|)', 'FontWeight', 'bold');
title('Graph of log(|F(h)-L|) vs log(h)', 'FontWeight', 'bold');
grid on;

% You can use this way but because of the fuzz on the left side 
% of 10^-4 it messes up the slope so its better to just compute by hand
%Find the slope of the log-log plot to get p value
% p = polyfit(x_log, y_log, 1);
% slope = p(1);
% disp(['The slope of the linearized graph is: ', num2str(slope)]);
