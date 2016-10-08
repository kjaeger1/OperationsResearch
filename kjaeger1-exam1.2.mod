##########################################################################
## Exam 1 - Part VI - Question 2 - Moneybags Venture Capital - MODEL	##
## AMPL code by Kevin Jaeger, University of Central Oklahoma	##
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

# The percentage of each of the three companies that we will aquire as
# an investment (as a percent in decimal format).
var InvestmentPercentage{INVESTMENTS} >= 0 <= 1;

# The amount of cash on hand at the end of each time period (in $ million)
var Cash{0..PlanningLength by TimeInterval} >= 0;

#########################
# OBJECTIVE             #
#########################

# Our objective is to maximize the amount of cash that we have on hand at the 
# end of the 3 year time period (in $ million)
maximize EndingCashFlow: Cash[3];

#########################
# CONSTRAINTS           #
#########################

#  These constraints ensures that cash (in $ milllion) is not negative at the end of each interval after period 0.
subject to MonthlyCashFlowBalance{t in .5..PlanningLength by TimeInterval}: Cash[t-.5] * (1 + MutualFundRate)+ sum{i in INVESTMENTS} InvestmentPercentage[i] * CashFlow[t,i] - Cash[t] >= 0;

# This constraint ensures that cash (in $ million) at the end of the first period (0) is not negative
subject to FirstPeriodCashflow: sum{i in INVESTMENTS} InvestmentPercentage[i] * CashFlow[0, i] + InitialCash - Cash[0] >= 0;



