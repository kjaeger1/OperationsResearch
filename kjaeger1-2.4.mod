#########################################
# Exercise 2.4 - Wood Built Bookshelves
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by , University of Central Oklahoma
#########################################

### Declare variables

# The number of unstained model A
var unstainedModelA >= 0;

# The number of unstained model A
var stainedModelA >= 0;

# The number of unstained model B
var unstainedModelB >= 0;

# The number of stained model B
var stainedModelB >= 0;

# The number of unstained model C
var unstainedModelC >= 0;

# The number of stained model C
var stainedModelC >= 0;


### Objective Function
maximize TotalProfit: 30*unstainedModelA + 60*stainedModelA +
					  20*unstainedModelB + 40*stainedModelB +
					  40*unstainedModelC + 75*stainedModelC;


### Constraints

# Minimum model B sales requirements
subject to modelBMinimums: unstainedModelB + stainedModelB >= 20;

# Maximum unstained model sales
subject to unstainedModelLimit: unstainedModelA + unstainedModelB +
								unstainedModelC <= 50;

# Labor Hours Limits
subject to CuttingLaborLimit: 1*(unstainedModelA + stainedModelA) +
							  0.5*(unstainedModelB + stainedModelB) +
							  2*(unstainedModelC + stainedModelC) <= 200;

subject to AssemblingLaborLimit: 4*(unstainedModelA + stainedModelA) +
							     3*(unstainedModelB + stainedModelB) +
							     6*(unstainedModelC + stainedModelC) <= 700;	

subject to StainingLaborLimit: 7*(stainedModelA) +
							   5*(stainedModelB) +
							   8*(stainedModelC) <= 550;							 						 


