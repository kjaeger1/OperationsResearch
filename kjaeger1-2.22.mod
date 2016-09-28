##########################################################
# Exercise 2.22 - Fitness Sneaker Company - MODEL
# From Deterministic Operations Research by David J. Rader
# by Kevin Jaeger, University of Central Oklahoma
# for MATH 4113/5113 - Operations Research 1 - Fall 2015
##########################################################

########################
# SETS                 #
########################

# NO SETS REQUIRED

########################
# PARAMETERS	       #
########################

# The number of months in the planning horizon
param Months >= 1 integer;

# The demand (in pairs) for sneakers in each month which MUST be met
param Demand {1..Months} >= 0;

# The time taken (in minutes per pair) for one worker to produce one pair of sneakers
param SneakerProductionTime >= 0;

# The number of regular hours that each worker can work each month (hours per worker per month)
param WorkerRegularHours >= 0;

# The maximum number of overtime hours that each worker can work per month (hours per worker per month)
param WorkerMaxOvertimeHours >= 0;

# The workers' salary (in dollars per month per worker) for the regular hours
param WorkerSalary >= 0;

# The workers' overtime pay rate (in dollars per hour per worker)
param OvertimeRate >= 0;

# The cost of hiring a worker (in dollars per worker)
param HiringCost >= 0;

# The cost of firing a worker (in dollars per worker)
param FiringCost >= 0;

# The capacity of storage (in pairs of sneakers)
param InventoryCapacity >= 0;

# The cost of storing sneakers (in dollars per pair per month)
param StorageCost >= 0;

# Inventory at the beginning of the planning period (in pairs of sneakers)
param InitialStorage >= 0;

# Workers at the beginning of the planning period (in workers)
param InitialWorkers >= 0;

#########################
# VARIABLES		#
#########################

# Overtime hours
var OverTime{1..Months} >= 0;

# Employees fired each month.
var FiredEmployees {1..Months} >= 0 integer;

# Employees hired each month.
var HiredEmployees {1..Months} >= 0 integer;

# Number of sneakers that can be stored in inventory.
var Inventory {0..Months} >= 0 <= InventoryCapacity integer;

# Number of available workers for the current month.
var CurrentEmployees {0..Months} >= 0 integer;

# Number of pairs produced per month
var SneakersProduced {1..Months} >= 0 integer;

#########################
# OBJECTIVE		#
#########################

# The objective is to minimize the cost while meeting demand for sneakers
minimize Cost: sum {m in 1..Months} WorkerSalary * CurrentEmployees[m] +
               sum {m in 1..Months} HiringCost * HiredEmployees[m] +
               sum {m in 1..Months} FiringCost * FiredEmployees[m] +
               sum {m in 1..Months} OvertimeRate * OverTime[m] +
               sum {m in 1..Months} StorageCost * Inventory[m];

#########################
# CONSTRAINTS		#
#########################

# Demand requirement.
subject to ProductionDemand {m in 1..Months}: (60 / SneakerProductionTime) * ((WorkerRegularHours * CurrentEmployees[m]) + OverTime[m]) >= SneakersProduced[m];

# Overtime Limit.
subject to OverTimeLimit {m in 1..Months}: WorkerMaxOvertimeHours*CurrentEmployees[m] >= OverTime[m];

# Inventory from month to month.
subject to InventoryPerMonth {m in 1..Months}: Inventory[m-1] + SneakersProduced[m] - Inventory[m] >= Demand[m];

# Balances employee flow month to month.
subject to EmployeesPerMonth {m in 1..Months}: CurrentEmployees[m-1] + HiredEmployees[m] - FiredEmployees[m] = CurrentEmployees[m];

# The number of employees at the beginning of the schedule.
subject to BeginningEmployees: CurrentEmployees[0] = InitialWorkers;

# Setting initial inventory amount.
subject to InitialInventoryConstraint: Inventory[0] = InitialStorage;

# Inventory has a maximum capacity.
subject to InventoryMaxCapacity {m in 1..Months}:  InventoryCapacity >= Inventory[m];



