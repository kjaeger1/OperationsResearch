##########################################################################
## Exam 1 - Part VII - Question 5 - Clean Coal Co. - MODEL		##
## AMPL code by 		, University of Central Oklahoma	##
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


#########################
# OBJECTIVE             #
#########################


#########################
# CONSTRAINTS           #
#########################

