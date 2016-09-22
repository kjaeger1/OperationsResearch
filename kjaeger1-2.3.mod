#########################################
# Exercise 2.3 - Film Packaging
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by , University of Central Oklahoma
#########################################

### Declare variables

# The number of square yards of 1mm film to be produced
var film1mm >= 0, <= 400;

# The number of square yards of 3mm film to be produced
var film3mm >= 0, <= 250;

# The number of square yards of 5mm film to be produced
var film5mm >= 0, <= 200;

# The number of square yards of 0.5mm film to be produced
var film0mm >= 0, <= 450;

# The revenue of the various films produced
var revenue = 110*film1mm + 90*film3mm + 60*film5mm + 100*film0mm;

# The material cost of the films produced
var materialCost = 30*film1mm + 10*film3mm + 10*film5mm + 20*film0mm;

#The variables for time used on each machine
var machine1TimeUsedForEachFilm = 5*film1mm + 4*film3mm + 4*film5mm + 6*film0mm;
var machine2TimeUsedForEachFilm = 8*film1mm + 7*film3mm + 5*film5mm + 10*film0mm;
var machine3TimeUsedForEachFilm = 9*film1mm + 5*film3mm + 4*film5mm + 6*film0mm;

# The labor cost for the films produced for each machine
var laborCost = (25*machine1TimeUsedForEachFilm)/60 + 
				(25*machine2TimeUsedForEachFilm)/60 +
				(35*machine3TimeUsedForEachFilm)/60;
### Objective Function

# The objective here is to maximize profit
# The profit (in dollars) can be found by taking the revenue, minus the cost, 
# minus the variable cost which itself can be calculated by multiplying the 
# labor cost by the required time.

maximize TotalProfit: revenue - materialCost - laborCost;

### Constraints

# The limit on Machine One's time in minutes
subject to Machine1: machine1TimeUsedForEachFilm <= 60*60;

# The limit on Machine Two's time in minutes
subject to Machine2: machine2TimeUsedForEachFilm <= 60*60;

# The limit on Machine Three's time in minutes
subject to Machine3: machine3TimeUsedForEachFilm <= 60*60;


