max_capacity = 100;     
initial_volume = 0;    
dt = 0.1;
filling_speed = 6;
draining_speed = 6;
time = 0;
volume = initial_volume;
i = 1;
while true
    i = i + 1;
    time(i) = time(i-1) + dt;  
    delta_volume = (filling_speed - draining_speed) * dt;
    volume(i) = volume(i-1) + delta_volume;    
    if volume(i) >= max_capacity
        volume(i) = max_capacity;
        break;
    elseif volume(i) <= 0
        volume(i) = 0;
        break;
    end
end
figure;
plot(time, volume, 'b-', 'LineWidth', 2);
xlabel('Time (seconds)');
ylabel('Water Volume (liters)');
title('Water Tank Fill and Drain Simulation');
legend(['Fill = ' num2str(filling_speed) ' L/s, Drain = ' num2str(draining_speed) ' L/s']);
grid on;