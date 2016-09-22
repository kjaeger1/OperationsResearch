#########################################
# Exercise 2.4 - Wood Built Bookshelves
# From Deterministic Operations Research by David J. Rader Jr.
# AMPL model by , University of Central Oklahoma
#########################################

### Declare variables

# The number of unstained model A
var f1 >= 0;
var f2 >= 0;
var f3 >= 0;
var p1 >= 0;
var p2 >= 0;
var p3 >= 0;
var p4 >= 0;

### Objective Function
minimize EmployeeCost: 320*(f1+f2+f3) + 120*(p1+p2+p3+p4);


### Constraints

# Minimum model B sales requirements
subject to Hours: f1 + p1 >= 4;
subject to Hours2: f1 + f2 + p2 >= 8;
subject to Hours3: f2 + f3 + p3 >= 10;
subject to Hours4: f3 + p4 >= 6;

subject to Staff1: f1 >= 2*p1;
subject to Staff2: f1 + f2 >= 2*p2;
subject to Staff3: f2 + f3 >= 2*p3;
subject to Staff4: f3 >= 2*p4;
							 						 


