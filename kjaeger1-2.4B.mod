#########################################
# Kevin Jaeger
# Exercise 2.4B - Wood Built Bookshelves (Set Version)
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by Dr. Brad Paynter, University of Central Oklahoma
# for MATH 4113/5113 - Operations Research 1 - Fall 2016
#########################################

########################
# SETS                 #
########################

# The set of bookshelf models
set MODELS;

# The set of finish types
set TYPES;

# The set of assembly departments
set DEPARTMENTS;

########################
# PARAMETERS           #
########################

# The amount of labor required from each department to build one bookshelf 
# by type and model (in hours)
param LaborRequired {TYPES, MODELS, DEPARTMENTS};

# The amount of labor available over the next two weeks 
# by department (in hours)
param LaborAvailable {DEPARTMENTS};

# The amount of profit earned from the manufacture and sale of one bookshelf
# by type and model (in dollars)
param Profit {TYPES, MODELS};

# The minimum demand by model
param MinDemand {MODELS};

# The maximum demand by type
param MaxDemand {TYPES};

########################
# VARIABLES            #
########################

# The Production Mix of Bookshelves including Model A,B,C in either Unstained or Stained
var BookshelfProduction{MODELS, TYPES} >= 0;

########################
# OBJECTIVE            #
########################

# The objective is to maximize profit in dollars for the production of bookshelves A,B,C in Unstained or Stained Finishes
maximize TotalProfit: sum{i in MODELS, j in TYPES} BookshelfProduction[i,j] * Profit[j,i];

#########################
# CONSTRAINTS           #
#########################

# Restriction of maximum quantity of each type of bookshelf
subject to MaxBookshelfProduction{j in TYPES}: sum {i in MODELS} BookshelfProduction[i,j] <= MaxDemand[j];

# The minimum quantity of bookshelves we must produce
subject to MinBookshelfProduction{i in MODELS}: sum {j in TYPES} BookshelfProduction[i,j] >= MinDemand[i];

# The Limit of the labor time in hours for each department
subject to LaborLimit{k in DEPARTMENTS}: sum {i in MODELS, j in TYPES} BookshelfProduction[i,j] * LaborRequired[j,i,k] <= LaborAvailable[k];
