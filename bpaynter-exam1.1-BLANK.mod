##########################################################################
# Exam 1 - Part V - Question 1 - Old McDonald's Farm - MODEL		##
# AMPL code by 			, University of Central Oklahoma	##
# for MATH 4113/5113 - Operations Research I - Fall 2016		##
# Optimal Solution Value: $9,140					##
##########################################################################
	 	      	 	   	 	      	       	 
########################	      	    	      		    
# SETS                 #   	     
########################

# The set of possible crops
set CROPS;

# The set of resources
set RESOURCES;

########################
# PARAMETERS	       #
########################

# The amount of each resource required by an acre of each crop
param ResourceRequired {CROPS, RESOURCES} >= 0;

# The amount of each resource available
param ResourceAvailable {RESOURCES} >= 0;

# The cost of each resource (in $)
param ResourceCost {RESOURCES} >= 0;

# The revenue from each crop (in $/acre)
param Revenue {CROPS} >= 0;

#########################
# VARIABLES             #
#########################


#########################
# OBJECTIVE             #
#########################


#########################
# CONSTRAINTS           #
#########################


