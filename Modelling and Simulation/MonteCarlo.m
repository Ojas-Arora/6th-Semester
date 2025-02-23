num_days = 10;
simulated_weather = zeros(num_days,1);
rainfall_amount = zeros(num_days,1);
simulated_weather(1) = 0;
days = ['0cm'; '1cm'; '2cm'; '3cm'; '4cm'];
prob_rain = [0.55; 0.35; 0.15; 0.10; 0.25]; 
cum_prob = zeros(size(prob_rain));
total_rain=0;

cum_prob(1) = prob_rain(1);
for i = 2:length(prob_rain)
    cum_prob(i) = cum_prob(i-1) + prob_rain(i);
end

tags_rain = zeros(length(cum_prob), 2);
prev = 0;
for i = 1:length(cum_prob)
    tags_rain(i, :) = [prev, floor(100*cum_prob(i))-1];
    prev = floor(100*cum_prob(i));
end

rain_table = table(days, prob_rain, cum_prob, strcat(string(tags_rain(:,1)), '-', string(tags_rain(:,2))), ...
                   'VariableNames', {'Day', 'Probability', 'Cumulative Probability', 'Range'});
disp('Rain on Previous Day');
disp(rain_table);

prob_no_rain = [0.50; 0.07; 0.05; 0.23; 0.15];
cum_prob_no_rain = zeros(size(prob_no_rain));

cum_prob_no_rain(1) = prob_no_rain(1);
for i = 2:length(prob_no_rain)
    cum_prob_no_rain(i) = cum_prob_no_rain(i-1) + prob_no_rain(i);
end

tags_no_rain = zeros(length(cum_prob_no_rain), 2);
prev = 0;
for i = 1:length(cum_prob_no_rain)
    tags_no_rain(i, :) = [prev, floor(100*cum_prob_no_rain(i))-1];
    prev = floor(100*cum_prob_no_rain(i));
end

no_rain_table = table(days, prob_no_rain, cum_prob_no_rain, strcat(string(tags_no_rain(:,1)), '-', string(tags_no_rain(:,2))), ...
                   'VariableNames', {'Day', 'Probability', 'Cumulative Probability', 'Range'});
disp('No Rain on Previous Day');
disp(no_rain_table);

function index = get_state(rand_val, tags)
    for j = 1:size(tags, 1)
        if rand_val >= tags(j, 1) && rand_val <= tags(j, 2)
            index = j;
            return;
        end
    end
    index = 0;
end

random_numbers = randi([0, 99], num_days, 1);
source_table = strings(num_days, 1);
source_tag = strings(num_days, 1);
random_numbers(1) = 0;

for i = 1:num_days
    rand_val = random_numbers(i);
    if i > 1
        if simulated_weather(i-1) == 1
            index = get_state(rand_val, tags_rain);
            simulated_weather(i) = (index > 1);
            rainfall_amount(i) = index - 1;
            if index > 1
                total_rain = total_rain + index - 1;
            end
            source_table(i) = "Rain Table";
            source_tag(i) = sprintf('%d-%d', tags_rain(index,1), tags_rain(index,2));
        else
            index = get_state(rand_val, tags_no_rain);
            simulated_weather(i) = (index > 1);
            rainfall_amount(i) = index - 1;
            if index > 1
                total_rain = total_rain + index - 1;
            end
            source_table(i) = "No Rain Table";
            source_tag(i) = sprintf('%d-%d', tags_no_rain(index,1), tags_no_rain(index,2));
        end
    else
        simulated_weather(i) = 0;
        source_table(i) = "No Rain Table";
        source_tag(i) = sprintf('%d-%d', tags_no_rain(1,1), tags_no_rain(1,2));
    end
end

rain_status_display = strings(num_days, 1);
for i = 1:num_days
    if simulated_weather(i) == 1
        rain_status_display(i) = sprintf('1 (%d cm)', rainfall_amount(i));
    else
        rain_status_display(i) = '0';
    end
end

simulated_table = table((1:num_days)', random_numbers, rain_status_display, source_table, source_tag, ...
                        'VariableNames', {'Day', 'Random Number', 'Rain Status', 'Source Table', 'Source Tag'});

total_rain_days = sum(simulated_weather);
total_no_rain_days = num_days - total_rain_days;

disp('Simulation Results');
disp(simulated_table);
fprintf('Total Rainy Days: %d\n', total_rain_days);
fprintf('Total Non-Rainy Days: %d\n', total_no_rain_days);
fprintf('Total rain received: %d cm\n', total_rain);
-