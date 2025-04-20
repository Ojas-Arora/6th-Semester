clc; clear; close all;
numDays = 100;               
initialInventory = 100;     
reorderPoint = 50;           
orderQuantity = 100;        
leadTime = 5;                
demandMean = 10;             
holdingCostPerUnit = 1;
orderingCost = 50;
shortageCostPerUnit = 5;
inventoryLevel = zeros(1, numDays);
inventory = initialInventory;
onOrder = 0;
orders = [];
demandHistory = zeros(1, numDays);
costTotal = 0;
shortage = 0;

for day = 1:numDays
    demand = poissrnd(demandMean);
    demandHistory(day) = demand;

    if inventory >= demand
        inventory = inventory - demand;
    else
        shortage = shortage + (demand - inventory);
        inventory = 0;
    end
    
    if ~isempty(orders) && orders(1,1) == day
        inventory = inventory + orders(1,2);
        orders(1,:) = []; 
    end
    
    if inventory < reorderPoint && onOrder == 0
        orders = [orders; day + leadTime, orderQuantity];
        costTotal = costTotal + orderingCost;
        onOrder = 1;
    end
    
    if isempty(orders) || orders(1,1) > day
        onOrder = 0;
    end
    costTotal = costTotal + inventory * holdingCostPerUnit;
    inventoryLevel(day) = inventory;
end

costTotal = costTotal + shortage * shortageCostPerUnit;

fprintf('Total Cost: $%.2f\n', costTotal);
fprintf('Total Shortage Units: %d\n', shortage);

figure;
plot(1:numDays, inventoryLevel, '-b', 'LineWidth', 2);
xlabel('Day');
ylabel('Inventory Level');
title('Inventory Level Over Time');
grid on;
