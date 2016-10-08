##########################################################################
## Exam 1 - Part VII - Question 5 - Clean Coal Co. - MODEL		##
## AMPL code by Kevin Jaeger, University of Central Oklahoma	##
## for MATH 4113/5113 - Operations Research I - Fall 2016		##
## Optimal Solution Value: $69,000					##
##########################################################################
	 	      	 	   	 	      	       	 
########################	      	    	      		    
# SETS                 #   	     
########################

# The set of Clean Coal Co.'s mines
set MINES;

# The set of Clean Coal Co.'s customers
set CUSTOMERS;

# The set of pollutants found in coal
set POLLUTANTS;

########################
# PARAMETERS	       #
########################

# The fraction of each pollutant in the coal from each mine
param PollutantContent {MINES, POLLUTANTS} >= 0 <= 1;

# The cost of extracting coal from each mine (in $/ton)
param ExtractionCost {MINES} >= 0;

# The production capacity of each mine (in ton/month)
param ProductionCapacity {MINES} >= 0;

# The upper limit on the average pollutant content the Clean Coal Co. can ship
param PollutantUpperLimit {POLLUTANTS} >= 0 <= 1;

# The demand of each customer (in tons/month)
param Demand {CUSTOMERS} >= 0;

# The cost of shipping from each mine to each customer (in $/ton)
param ShippingCost {MINES, CUSTOMERS} >= 0;

# The capacity of a rail car
param CarCapacity >= 0;

# The potential additional demand (in tons/month)
param AdditionalDemand {CUSTOMERS} >= 0;

# The price customers would pay for additional coal (in $/ton)
param AdditionalCoalPrice >= 0;

# The cost of mine expansion (in $/month)
param ExpansionCost {MINES} >= 0;

# The potential additional capacity (in tons/month)
param AdditionalCapacity {MINES} >= 0;

#########################
# VARIABLES             #
#########################

# The coal production of each mine shipped to each customer (in ton/month)
var CoalProduction{MINES, CUSTOMERS} >= 0;

# The decision whether or not to accept additional orders from selected customers
var AcceptAdditionalOrders{CUSTOMERS} binary;

# The decision whether or not to expand mine capacity for selected mines
var ExpandMineCapacity{MINES} binary;

#########################
# OBJECTIVE             #
#########################

# The objective is to minimize the shipping cost of coal to customers (in $/month)
minimize Cost: sum{m in MINES, c in CUSTOMERS} CoalProduction[m,c] * ShippingCost[m,c]
			 - sum{c in CUSTOMERS} AdditionalDemand[c] * AdditionalCoalPrice * AcceptAdditionalOrders[c]
			 + sum{m in MINES} ExpansionCost[m] * ExpandMineCapacity[m];

#########################
# CONSTRAINTS           #
#########################

# This constraint limits the amount of pollutants (Ash and Sulpher) that may be produced (in %)
subject to LimitedPollution{p in POLLUTANTS}: sum{m in MINES, c in CUSTOMERS} CoalProduction[m,c] * PollutantContent[m,p]
											<= PollutantUpperLimit[p] * sum{m in MINES, c in CUSTOMERS} CoalProduction[m,c];
# This constraint ensures that production capacity limits are enforced (in ton/month)
subject to LimitedProductionCapacity{m in MINES}: sum{c in CUSTOMERS} CoalProduction[m,c] 
											    <= ProductionCapacity[m] + AdditionalCapacity[m] * ExpandMineCapacity[m];

# This constraint ensures that demand is met for each customer each month (in ton/month)
subject to DemandRequirement{c in CUSTOMERS}: sum{m in MINES} CoalProduction[m,c] 
					                        >= Demand[c] + AdditionalDemand[c] * AcceptAdditionalOrders[c];

# We can only expand one mine
subject to SingleMineExpansion: sum{m in MINES} ExpandMineCapacity[m] <= 1;


