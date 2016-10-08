##########################################################################
## Exam 1 - Part VI - Question 2 - Moneybags Venture Capital - MODEL	##
## AMPL code by 		, University of Central Oklahoma	##
## for MATH 4113/5113 - Operations Research I - Fall 2016		##
## Optimal Solution Value: $6,456,691,57				##
##########################################################################
	 	      	 	   	 	      	       	 
########################	      	    	      		    
# SETS                 #   	     
########################

# The set of companies that MVC can invest in.
set INVESTMENTS;

########################
# PARAMETERS	       #
########################

# The length of the planning interval (in years)
param PlanningLength >= 0 integer;

# The length of each time interval in the planning period (in years)
param TimeInterval >= 0;

# The initial amount of cash MVC has on hand (in $ million)
param InitialCash;

# The amount of cash each investment company expects to
# or have available to disburse at each time point (in $ million)
param CashFlow {0..PlanningLength by TimeInterval, INVESTMENTS};

# The six-month return rate at which MVC earns interest
# on its cash when invested in traditional mutual funds.
param MutualFundRate >= 0 <= 1;

#########################
# VARIABLES             #
#########################


#########################
# OBJECTIVE             #
#########################


#########################
# CONSTRAINTS           #
#########################
