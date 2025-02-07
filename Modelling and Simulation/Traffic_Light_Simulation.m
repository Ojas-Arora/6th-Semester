clc; clear; close all;

figure('Color', 'black', 'Position', [400 200 400 600]);
axis off;
hold on;

rectangle('Position', [150, 100, 100, 300], 'FaceColor', [0.2 0.2 0.2], 'EdgeColor', 'white', 'LineWidth', 2);

x = 200;
y_red = 350;
y_yellow = 250;
y_green = 150;
radius = 30;

red_light = draw_circle(x, y_red, radius, 'black');
yellow_light = draw_circle(x, y_yellow, radius, 'black');
green_light = draw_circle(x, y_green, radius, 'black');

heading_text = text(200, 480, 'TRAFFIC LIGHT SIMULATION', 'Color', 'white', 'FontSize', 8, 'HorizontalAlignment', 'center', 'FontWeight', 'bold');

text_handle = text(200, 440, '', 'Color', 'white', 'FontSize', 8, 'HorizontalAlignment', 'center', 'FontWeight', 'bold');

figure('Color', 'white', 'Position', [850 200 600 400]);
hold on;
grid on;
title('Traffic Light State Plot');
xlabel('Time (s)');
ylabel('State (1=Red, 2=Yellow, 3=Green)');
yticks([1, 2, 3]);
yticklabels({'Red', 'Yellow', 'Green'});
xlim([0 50]);
ylim([0.5 3.5]);

xticks(0:5:50);

plot_handle = plot(NaN, NaN, '-o', 'LineWidth', 2);

time_counter = 0;
while true
    set(red_light, 'FaceColor', 'red');
    time_counter = update_plot_and_clock(plot_handle, text_handle, time_counter, 'Red', 1, 15);
    set(red_light, 'FaceColor', 'black');

    set(yellow_light, 'FaceColor', 'yellow');
    time_counter = update_plot_and_clock(plot_handle, text_handle, time_counter, 'Yellow', 2, 5);
    set(yellow_light, 'FaceColor', 'black');

    set(green_light, 'FaceColor', 'green');
    time_counter = update_plot_and_clock(plot_handle, text_handle, time_counter, 'Green', 3, 15);
    set(green_light, 'FaceColor', 'black');
end

function time_counter = update_plot_and_clock(plot_handle, text_handle, time_counter, state, state_value, duration)
    for t = duration:-1:1
        set(text_handle, 'String', sprintf('Traffic Light: %s - %d seconds', state, t));
        time_counter = time_counter + 1;
        set(plot_handle, 'XData', [get(plot_handle, 'XData'), time_counter], 'YData', [get(plot_handle, 'YData'), state_value]);
        pause(1);
    end
end

function circle = draw_circle(x, y, r, color)
    theta = linspace(0, 2*pi, 100);
    x_circle = r * cos(theta) + x;
    y_circle = r * sin(theta) + y;
    circle = fill(x_circle, y_circle, color, 'EdgeColor', 'white', 'LineWidth', 2);
end
