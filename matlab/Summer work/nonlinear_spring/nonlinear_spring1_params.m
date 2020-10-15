% This is the initial test file 
% A rigid prismatic joint of a nonlinear spring. This method works the best
% right now. 

% Various method such as combining linear springs together and testing
% actuation by mimicing a hill muscle model was tried out but unsuccessful

% In the end it makes sense to stick with a simple nonlinear spring
% (currently by using a deg5 polynomial but this can be changed) is the
% easiest and simplest way to implement a working antagonistic
% configuration. Perhaps future efforts will be made for mimicing muscles
% better but that's not the point of this project so will be ignored for
% the time being. 

rod_L = 50;