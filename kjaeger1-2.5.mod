#########################################
# Kevin Jaeger
# Exercise 2.5 - Basketball Goal Construction
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by , University of Central Oklahoma
#########################################

### Declare variables

# The number of poles to be produced in house
var polesMade >= 0;

# The number of poles to be purchased from outside supplier
var polesBought >= 0;

# The number of rims to be produced in house
var rimsMade >= 0;

# The number of rims to be purchased from outside supplier
var rimsBought >= 0;

# The number of backboards to be made

param backboards = 500;

#The variables for time used on each Department
var dept_A_labor = 2*polesMade + 2.5*backboards + 1*rimsMade;
var dept_B_labor = 0.5*polesMade + 1*backboards + 1.5*rimsMade;
var dept_C_labor = 1*polesMade + 2*backboards + 1*rimsMade;

### Objective Function

# The objective here is to minimize cost for producing the rims and poles by determining which parts
# to buy from an outside supplier and which parts to make in house constrained by manufacturing capability.

minimize ProductionCost: 60*polesMade + 95*polesBought + 80*backboards + 30*rimsMade + 45*rimsBought;

### Constraints

# We must make or buy 500 poles
subject to Poles: polesMade + polesBought = 500;

# We must make or buy 500 rims
subject to Rims: rimsMade + rimsBought = 500;

# The limit on Department A time in hours.
subject to DepartmentA: dept_A_labor <= 2000;

# The limit on Department B time in hours. 
subject to DepartmentB: dept_B_labor <= 900;

# The limit on Department C time in hours.
subject to DepartmentC: dept_C_labor <= 1500;


