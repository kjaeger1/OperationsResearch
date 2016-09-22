#########################################
## Crude Oil Refining Model
## by Kevin Jaeger
#########################################

# The amount of light crude oil processed in barrels
var lightCrude >= 0;

# The amount of heavy crude oil processed in barrels
var heavyCrude >= 0;

# The objective is to minimze cost
# The total cost is $20 for each barrel of light crude
# plus $15 for each barrel of heavy crude
minimize TotalCost: 20*lightCrude + 15*heavyCrude; 

# This constraint ensures that we produce enough gasoline
subject to Gasoline: 0.4*lightCrude + 0.3*heavyCrude >= 1000000;

# This constraint ensures that we produce enough kerosine
subject to Kerosine: 0.25*lightCrude + 0.4*heavyCrude >= 500000;

# This constraint ensures that we produce enough jet fuel
subject to JetFuel: 0.3*lightCrude + 0.22*heavyCrude >= 300000;
