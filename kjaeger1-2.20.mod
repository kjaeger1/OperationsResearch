##########################################################
# Exercise 2.20 - Garbage Can Production - MODEL
# From Deterministic Operations Research by David J. Rader
# by Kevin Jaeger, University of Central Oklahoma
# for MATH 4113/5113 - Operations Research I - Fall 2015
##########################################################

########################
# SETS                 #
########################

# The set of garbage can sizes
set CANS;

# The set of manufacturing processes
set PROCESSES;

########################
# PARAMETERS	       #
########################

# The number of months in the planning horizon
param Months >= 1 integer;

# The initial number of each can in storage
param InitialStorage {CANS} >= 0;

# The storage requirements for each can (in storage units)
param StorageSize {CANS} >= 0;

# The amount of plastic used in manufacture
param PlasticRequired {CANS} >= 0;

# The cost of production (in dollars per can)
param ProductionCost {CANS} >= 0;

# The cost of storage (in dollars per can)
param StorageCost {CANS} >= 0;

# The demand for garbage cans
param Demand {CANS, 1..Months} >= 0;

# The time required to produce garbage cans (in hours per can)
param ProductionTime {CANS, PROCESSES} >= 0;

# The total amount of time available in each month (in hours)
param TimeAvailable {PROCESSES} >= 0;

# The storage capacity available (in storage units)
param StorageCapacity >= 0;

# The amount of raw material available each month (in pounds)
param PlasticAvailable >= 0;

#########################
# VARIABLES		#
#########################
# The quantity of trash cans produced in a given month
var CansProduced{CANS, 1..Months} >= 0;

# The quantity of trash cans stored in a given month
var CansStored{CANS, 0..Months} >= 0;


#########################
# OBJECTIVE		#
#########################

# The objective is to minimize the production cost while meeting demand
minimize Cost: sum{c in CANS, m in 1..Months} CansProduced[c, m] * ProductionCost[c]
			 + sum{c in CANS, m in 1..Months} CansStored[c, m] * StorageCost[c];


#########################
# CONSTRAINTS		#
#########################

# We have 350 painting hours available each month and 650 machine hours each month
subject to PaintingandMachineTimeLimit{p in PROCESSES, m in 1..Months}: sum{c in CANS} CansProduced[c,m] * ProductionTime[c,p] <= TimeAvailable[p]; 

# We have only 30000 pounds of plastic each month
subject to PlasticLimit{m in 1..Months}: sum{c in CANS} CansProduced[c,m] * PlasticRequired[c] <= PlasticAvailable;

# We have 10000 units of storage available each month
subject to StorageLimit{m in 1..Months}: sum{c in CANS} CansStored[c,m] * StorageSize[c] <= StorageCapacity;

# Initial Storage constraint
subject to InitialStorageValues{c in CANS}: CansStored[c,0] = InitialStorage[c];

# Production Demand Constraint
subject to DemandRequirement{m in 1..Months, c in CANS}: CansProduced[c,m] + CansStored[c, m-1]  - CansStored[c, m] >= Demand[c,m];



