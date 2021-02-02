Contents: 

u_not_expanded1:
PID controller to find u -> into plant directly

u_expanded1:
PID controller to find u -> then find u1 u2 (first try)

u_expanded2: 
MPC to find u -> then find u1 u2 (doesn't work well) 

u_expanded3:
MPC to find u -> use that u directly to control mxddot = u. 

u_expanded4: 
MPC to find u -> allocator to find u1 u2. (allocator not working well...)

Allocator_tests1:
MPC to find u -> allocator to find u1 u2. This model for testing different allocator models
Also comparing between linear and non-linear controllers. 

LQR_test1: 
Testing the LQR controller for full state feedback. 

u_compare: 
Comparing non-expanded and expanded plant for differences

reference_trajectory:
Defining y_ref, the reference trajectory of the output. 