##########################################################################
# Exam 1 - Part V - Question 1 - Old McDonald's Farm - MODEL		##
# AMPL code by Kevin Jaeger, University of Central Oklahoma	##
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

# The amount of each crop we will plant (in acres)
var CropProduction{CROPS} >= 0;

#########################
# OBJECTIVE             #
#########################

# The objective is to plant the crop production mix (Corn and Soybeans in this case) that 
# will maximize the profit (in $)
maximize Profit: sum{c in CROPS} CropProduction[c] * Revenue[c] 
			   - sum{c in CROPS, r in RESOURCES} ResourceRequired[c, r] * ResourceCost[r] * CropProduction[c]; 
					

#########################
# CONSTRAINTS           #
#########################

# These constraints ensures that each resource limitation is accounted for (Acrage in acres, Labor in workers, and Fertilizer in tons)
subject to LimitedResources {r in RESOURCES}: sum{c in CROPS} CropProduction[c] * ResourceRequired[c,r] <= ResourceAvailable[r];


