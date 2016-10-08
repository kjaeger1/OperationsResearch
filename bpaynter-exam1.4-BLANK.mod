##########################################################################
## Exam 1 - Part VII - Question 4 - Clean Coal Co. - MODEL		##
## AMPL code by 		, University of Central Oklahoma	##
## for MATH 4113/5113 - Operations Research I - Fall 2016		##
## Optimal Solution Value: $140,500					##
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

#########################
# VARIABLES             #
#########################


#########################
# OBJECTIVE             #
#########################


#########################
# CONSTRAINTS           #
#########################

