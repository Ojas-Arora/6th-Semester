Read online retail data (shared in data set section) using csv module and perform following operations.  CSV reader documentation (https://docs.python.org/3/library/csv.html)
or use following code:
import csv
with open('some.csv', newline='') as f:
reader = csv.reader(f)
for row in reader:
print(row)

Solve:
1. Find mean, std dev, min , max of unitprice field.
2. Draw histogram of unitprice field using matplotlib
3. Find mean of unitprice group by country and plot them
4. Find min and max of unit price group by customerID
5. Find cumulative sales monthly and yearly and plot them
