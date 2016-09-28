#########################################
# Exercise 2.14 - Cattle Feed
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Kevin Jaeger, University of Central Oklahoma
# for MATH 4113/5113 - Operations Research 1 - Fall 2016
#########################################

########################
# SETS                 #
########################

set INGREDIENTS;
set NUTRIENTS;

########################
# PARAMETERS           #
########################

# The amount of nutrient j in ingredient i (in % of RDA per ton)
param Nutrition {INGREDIENTS, NUTRIENTS} >= 0;

# The cost of each ingredient (in $ per ton)
param Cost {INGREDIENTS} >= 0;

# The minimum amount of each nutrient that must be in 1 ton of feed (in % of RDA)
param MinNutrition {NUTRIENTS} >= 0 <= 100;

# The maximum amount of each nutrient that must be in 1 ton of feed (in % of RDA)
param MaxNutrition {NUTRIENTS} >= 0;

########################
# VARIABLES            #
########################
var ProductionMixture{INGREDIENTS} >= 0;

########################
# OBJECTIVE            #
########################

# The objective is to minimize the cost of producing one ton of feed while meeting 
# the nutrition requirements.
minimize OneTonMixtureCost: sum{i in INGREDIENTS} Cost[i] * ProductionMixture[i];

#########################
# CONSTRAINTS           #
#########################

# The ratio of ingredients must = 1
subject to RatioEquality: sum{i in INGREDIENTS} ProductionMixture[i] = 1;

# The minimum nutrition mixture of each nutrient must be met.
subject to MinNutrientRequirements{n in NUTRIENTS}: sum{i in INGREDIENTS} ProductionMixture[i] * Nutrition[i,n] >= MinNutrition[n]; 

# The maximum nutrition mixture of each nutrient must be met.
subject to MaxNutrientRequirements{n in NUTRIENTS}: sum{i in INGREDIENTS} ProductionMixture[i] * Nutrition[i,n] <= MaxNutrition[n];
