#########################################
# Exercise 2.1 - CT Furniture Company
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by , University of Central Oklahoma
#########################################

### Declare variables

# The number of finished chairs CT must make
var FinishedChairs >= 0;

# The number of unfinished chairs CT must make
var UnfinishedChairs >= 0;

# The number of finished tables CT must make
var FinishedTables >= 0;

# The number of unfinished tables CT must make
var UnfinishedTables >= 0;



### Objective Function

# The objective is to maximize profit. 
# The profit for each item is calculated by subtracting the cost of lumber from the selling price.
# This is then summed to find the total profit
maximize TotalProfit: 70*FinishedTables + 30*UnfinishedTables + 
					  35*FinishedChairs + 10*UnfinishedChairs;


### Constraints

# Limit on available lumber (in board-feet)
subject to LumberLimit: 25*FinishedTables + 25*UnfinishedTables + 
						10*FinishedChairs + 10*UnfinishedChairs <= 10000;

# Limit on available labor (in manhours)
subject to LaborLimit: 12*FinishedTables + 4*UnfinishedTables +
						8*FinishedChairs + 2*UnfinishedChairs <= 2500;

# Ratio restriction
subject to Ratio: (FinishedTables + UnfinishedTables) <= (2*(FinishedChairs + UnfinishedChairs));

# Special orders on chairs and tables
subject to TableOrders: (FinishedTables + UnfinishedTables) >= 200;
subject to ChairOrders: (FinishedChairs + UnfinishedChairs) >= 450;
