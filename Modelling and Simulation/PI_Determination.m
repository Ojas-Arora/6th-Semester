clc; clear; close all;
R1 = [0.82, 0.34, 0.48, 0.51, 0.16, 0.69, 0.37, 0.50, 0.51, 0.48, ...
      0.82, 0.36, 0.50, 0.38, 0.51, 0.27, 0.55, 0.84, 0.95, 0.62, ...
      0.57, 0.51, 0.55, 0.12, 0.95, 0.39, 0.32, 0.35, 0.69, 0.59, ...
      0.38, 0.16, 0.33];

R2 = [0.95, 0.14, 0.37, 0.72, 0.33, 0.59, 0.74, 0.72, 0.76, 0.63, ...
      0.57, 0.40, 0.74, 0.81, 0.80, 0.86, 0.93, 0.86, 0.81, 0.77, ...
      0.57, 0.69, 0.74, 0.99, 0.99, 0.81, 0.94, 0.86, 0.86, 0.78, ...
      0.65, 0.87, 0.16];

N = length(R1);

Root_1_R1_sq = sqrt(1 - R1.^2);

inside_circle = (R1.^2 + R2.^2) <= 1;

M = sum(inside_circle);

pi_estimate = (M / N) * 4;

fprintf('---------------------------------------------------------\n');
fprintf('|  R1  |  R2 | sqrt(1-R1^2) | In/Out  |\n');
fprintf('---------------------------------------------------------\n');


for i = 1:N
    if inside_circle(i)
        status = 'In ';
    else
        status = 'Out';
    end
    fprintf('| %.2f | %.2f |   %.4f   |   %s   |\n', R1(i), R2(i), Root_1_R1_sq(i), status);
end
fprintf('---------------------------------------------------------\n');

fprintf('\nTotal Random Points (N) = %d\n', N);
fprintf('Points inside Quarter Circle (M) = %d\n', M);
fprintf('Ratio (M/N) = %.4f\n', M / N);
fprintf('Estimated value of Pi = (M/N) * 4 = %.4f\n', pi_estimate);
