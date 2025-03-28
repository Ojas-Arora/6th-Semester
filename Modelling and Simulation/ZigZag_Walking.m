clc;
clear;
close all;
num_steps = 20;
x = zeros(num_steps+1, 1);
y = zeros(num_steps+1, 1);
directions = repmat(['L'; 'F'; 'R'; 'F'], ceil(num_steps/4), 1);
directions = directions(1:num_steps); 
for i = 1:num_steps
    switch directions(i)
        case 'L'  
            x(i+1) = x(i) - 1;
            y(i+1) = y(i);
        case 'R'  
            x(i+1) = x(i) + 1;
            y(i+1) = y(i);
        case 'F'  
            x(i+1) = x(i);
            y(i+1) = y(i) + 1;
    end
end
T = table((1:num_steps)', directions, x(2:end), y(2:end), ...
    'VariableNames', {'Step', 'Direction', 'X', 'Y'});
disp(T);
figure;
plot(x, y, '-o', 'LineWidth', 2);
grid on;
xlabel('X Position');
ylabel('Y Position');
title('Zigzag Walking Person Simulation');
axis equal;
hold on;
scatter(x(1), y(1), 100, 'r', 'filled'); 
scatter(x(end), y(end), 100, 'g', 'filled'); 
hold off;
