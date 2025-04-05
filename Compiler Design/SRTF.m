processes = [1 2 3 4 5]; 
arrival_time = [0 1 2 3 4];
burst_time = [6 1 2 3 4]; 

n = length(processes);
remaining_time = burst_time;
completion_time = zeros(1, n);
waiting_time = zeros(1, n);
turnaround_time = zeros(1, n);

time = 0;
completed = 0;
gantt = [];
current_process = -1;

while completed < n
    min_time = inf;
    selected_process = -1;
    
    for i = 1:n
        if arrival_time(i) <= time && remaining_time(i) > 0
            if remaining_time(i) < min_time
                min_time = remaining_time(i);
                selected_process = i;
            end
        end
    end
    
    if selected_process == -1 
        gantt = [gantt; -1, time, time + 1];
        time = time + 1;
    else
        if current_process ~= selected_process
            gantt = [gantt; selected_process, time, time + 1];
            current_process = selected_process;
        else
            gantt(end, 3) = time + 1;
        end
        remaining_time(selected_process) = remaining_time(selected_process) - 1;
        time = time + 1;
        
        if remaining_time(selected_process) == 0
            completion_time(selected_process) = time;
            completed = completed + 1;
        end
    end 
end

for i = 1:n
    turnaround_time(i) = completion_time(i) - arrival_time(i);
    waiting_time(i) = turnaround_time(i) - burst_time(i);
end

avg_tat = mean(turnaround_time);
avg_wt = mean(waiting_time);

fprintf('\n-------------------------------------------------\n');
fprintf('| %-8s | %-4s | %-4s | %-4s | %-4s | %-4s |\n', 'Process', 'AT', 'BT', 'CT', 'TAT', 'WT');
fprintf('-------------------------------------------------\n');
for i = 1:n
    fprintf('| %-8s | %-4d | %-4d | %-4d | %-4d | %-4d |\n', ['P' num2str(i)], arrival_time(i), burst_time(i), completion_time(i), turnaround_time(i), waiting_time(i));
end
fprintf('-------------------------------------------------\n');
fprintf('Average Turnaround Time: %.2f\n', avg_tat);
fprintf('Average Waiting Time: %.2f\n', avg_wt);

figure;
for i = 1:size(gantt,1)
    if gantt(i,1) ~= -1
        rectangle('Position', [gantt(i,2), 0, gantt(i,3)-gantt(i,2), 1], 'FaceColor', [0.8 0.9 0.9]);
        text((gantt(i,2) + gantt(i,3)) / 2, 0.5, ['P' num2str(gantt(i,1))], 'HorizontalAlignment', 'center', 'FontSize', 10);
    end
end
for i = 1:size(gantt,1)
    line([gantt(i,2) gantt(i,2)], [0 1], 'Color', 'k', 'LineWidth', 1);
end
line([gantt(end,3) gantt(end,3)], [0 1], 'Color', 'k', 'LineWidth', 1);
line([gantt(1,2) gantt(end,3)], [0 0], 'Color', 'k', 'LineWidth', 1);
line([gantt(1,2) gantt(end,3)], [1 1], 'Color', 'k', 'LineWidth', 1);
for i = 1:size(gantt,1)
    text(gantt(i,2), -0.2, num2str(gantt(i,2)), 'HorizontalAlignment', 'center', 'FontSize', 8);
end
text(gantt(end,3), -0.2, num2str(gantt(end,3)), 'HorizontalAlignment', 'center', 'FontSize', 8);
title('Gantt Chart for Shortest Remaining Time First');
xlabel('Time');
ylim([-0.5 1.5]);
axis off;
