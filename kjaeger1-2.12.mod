#########################################
# Kevin Jaeger
# Exercise 2.12 - Mammoth Oil
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by 	, University of Central Oklahoma
# for MATH 4113/5113 - Operations Research 1 - Fall 2016
#########################################

########################
# SETS                 #
########################

set GASOLINES;
set CRUDEOILS;

########################
# PARAMETERS           #
########################

# The price of a barrel of crude oil (in $/barrel) 
param PurchasePrice {CRUDEOILS} >= 0;

# The octane rating of each type of crude
param OctaneRating {CRUDEOILS} >= 0;

# The quality rating of each type of crude
param QualityRating {CRUDEOILS} >= 0;

# The maximum amount of each crude available (in barrels)
param MaxAvailable {CRUDEOILS} >= 0;

# The minimum octane rating required for each gasoline
param MinOctaneRequired {GASOLINES} >= 0;

# The minimum quality rating of each gasoline
param MinQualityRequired {GASOLINES} >= 0;

# The amount of each gasoline that has already been ordered.
param GasDemanded {GASOLINES} >= 0;

# The total capacity of the refinery (in barrels)
param RefineryCapacity >= 0;

# The cost of refining crude (in $/barrel)
param RefiningCost >= 0;


########################
# VARIABLES            #
########################

# The barrels of oil type i used to produce gasoline type j daily
var Production{CRUDEOILS, GASOLINES} >= 0;

########################
# OBJECTIVE            #
########################
minimize ProductionCost: sum{i in CRUDEOILS} PurchasePrice[i] * sum{j in GASOLINES} Production[i,j]
						+ RefiningCost * sum{j in GASOLINES} sum{i in CRUDEOILS} Production[i,j];

#########################
# CONSTRAINTS           #
#########################

# Gasolines must have avg octane rating of gas 1 87, gas 2 89, and gas 3 91
subject to MinOctaneAvgRating {i in GASOLINES}: sum{j in CRUDEOILS} Production[j,i] * OctaneRating[j]
													>= MinOctaneRequired[i] * sum{j in CRUDEOILS} Production[j,i];

# Gasolines must have a quality rating of gas 1 60, gas 2 70, gas 3 80.
subject to minQualityAvgRating {i in GASOLINES}: sum{j in CRUDEOILS} QualityRating[j] * Production[j,i]
												 >= MinQualityRequired[i] * sum{j in CRUDEOILS} Production[j,i];

# We can purchase a maximum of 5000 barrels per day of each type of crude oil
subject to MaxDailyCrudePurchasingLimit {i in CRUDEOILS}: sum{j in GASOLINES} Production[i,j] <= MaxAvailable[i];

# We must produce 4000 barrels of gas 1, 3000 barrels of gas 2, and 2000 barrels of gas 3
subject to MinDailyGasProductionLimit {i in GASOLINES}: sum{j in CRUDEOILS} Production[j,i] >= GasDemanded[i];
