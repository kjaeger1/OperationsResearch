##########################################################
# Exercise 2.19 - WellBuilt Cabinet Co. - MODEL
# From Deterministic Operations Research by David J. Rader
# by Kevin Jaeger, University of Central Oklahoma
# for MATH 4113/5113 - Operations Research I - Fall 2015
##########################################################

########################
# SETS                 #
########################

# The set of all log diameters
set LOGS;

# The set of lumber grades that can be purchased
set GRADES;

# The set of lumber types
set TYPES;

########################
# PARAMETERS	       #
########################

# The cost (in dollars per log) of logs
param LogCost {LOGS} >= 0;

# The number of blanks produced per log
param BlanksPerLog {LOGS} >= 0;

# The number of boardfeet of lumber produced per log
param BoardfeetPerLog {LOGS} >= 0;

# The number of logs available for purchase.
param LogsAvailable {LOGS} >= 0;

# The cost (in dollars per boardfoot) of purchased lumber
param LumberCost {GRADES, TYPES} >= 0;

# The number of blanks produced per boardfoot of lumber
param BlanksPerBoardfoot {GRADES} >= 0;

# The number of boardfeet of lumber avialable for purchase
param LumberAvailable {GRADES} >= 0;

# The capacity (in logs) of the company mill
param MillCapacity >= 0;

# The capacity (in boardfeet) of the company kiln
param KilnCapacity >= 0;

# The number of blanks required
param BlanksRequired >= 0;

#########################
# VARIABLES		#
#########################

# We will mill logs ourselves to create wood panels to meet demand
var MadeLogs{LOGS} >= 0;

# We may also purchase lumber in various types and grades
var BoughtLumber{GRADES, TYPES} >= 0;

#########################
# OBJECTIVE		#
#########################

# Our objective is to meet demand while minimzing cost through a mix of producing our own
# boards and purchasing logs to make boards.
minimize Cost: sum{l in LOGS} MadeLogs[l] * LogCost[l] + sum{g in GRADES, t in TYPES} BoughtLumber[g,t] * LumberCost[g,t];

#########################
# CONSTRAINTS		#
#########################

# Weekly Production Requirement is 2000 Blanks per week
subject to WeeklyBlankProductionMinimum: sum{l in LOGS} MadeLogs[l] * BlanksPerLog[l] 
										+ sum{g in GRADES, t in TYPES} BoughtLumber[g,t] * BlanksPerBoardfoot[g] >= BlanksRequired;

# The mill can only process 50 Logs per week
subject to WeeklyMilledLogMaximum: sum{l in LOGS} MadeLogs[l] <= MillCapacity;

# The kiln can only dry 7500 board feet of lumber per week
subject to WeeklyKilnMaximum: 	sum{l in LOGS} MadeLogs[l] * BoardfeetPerLog[l]
								+ sum{g in GRADES, t in TYPES}BoughtLumber[g, 'Green'] * BlanksPerBoardfoot[g] <= KilnCapacity;

# We only have a certain number of logs 
subject to MaxLogsAvailable{l in LOGS}: MadeLogs[l] <= LogsAvailable[l];

# We have only a certain number of board feet available
subject to MaxBoardFeetAvailable{g in GRADES}: sum{t in TYPES}BoughtLumber[g,t] <= LumberAvailable[g];

