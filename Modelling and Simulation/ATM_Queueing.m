clc; clear; close all;
lambda_arrival = 1/1.5; 
lambda_service = 1/2.0; 
num_customers = 10; 
inter_arrival_times = exprnd(1/lambda_arrival, num_customers, 1);
service_times = exprnd(1/lambda_service, num_customers, 1);
arrival_times = zeros(num_customers, 1);
service_start_times = zeros(num_customers, 1);
departure_times = zeros(num_customers, 1);
for i = 1:num_customers
    if i == 1
        arrival_times(i) = inter_arrival_times(i);
        service_start_times(i) = arrival_times(i);
    else
        arrival_times(i) = arrival_times(i-1) + inter_arrival_times(i);
        service_start_times(i) = max(arrival_times(i), departure_times(i-1));
    end
    departure_times(i) = service_start_times(i) + service_times(i);
end
fprintf('\n--------------------------------------------------------------------------------\n');
fprintf('| %-10s | %-10s | %-10s | %-10s | %-15s | %-10s |\n', ...
    'Customer', 'IAT', 'AT', 'ST', 'Start Service', 'Departure');
fprintf('--------------------------------------------------------------------------------\n');

for i = 1:num_customers
    fprintf('| %-10d | %-10.2f | %-10.2f | %-10.2f | %-15.2f | %-10.2f |\n', ...
        i, inter_arrival_times(i), arrival_times(i), service_times(i), ...
        service_start_times(i), departure_times(i));
end
fprintf('--------------------------------------------------------------------------------\n');
figure;
stairs(arrival_times, 1:num_customers, 'b', 'LineWidth', 2); hold on;
stairs(departure_times, 1:num_customers, 'r', 'LineWidth', 2);
xlabel('Time');
ylabel('Number of Customers');
title('Poisson Process: Arrival and Departure Times');
legend('Arrivals', 'Departures');
grid on;
queue_length = zeros(num_customers, 1);
for i = 1:num_customers
    queue_length(i) = sum(service_start_times(1:i) > arrival_times(i));
end
figure;
stairs(arrival_times, queue_length, 'g', 'LineWidth', 2);
hold on;
plot(departure_times, queue_length, 'ro', 'MarkerFaceColor', 'r');
xlabel('Time');
ylabel('Queue Length');
title('Poisson Queue Length Over Time');
legend('Queue Length at Arrival', 'Queue Cleared at Departure');
grid on;
