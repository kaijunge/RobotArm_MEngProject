% Run params.m to retreive any parameters
params

% Load the simulink model 
sim('SingleMass.slx');
sim('MassSpring.slx');
sim('MassSpring_cancel_dynamics.slx');

set_param('SingleMass','SimMechanicsOpenEditorOnUpdate','off');
set_param('MassSpring','SimMechanicsOpenEditorOnUpdate','off');
set_param('MassSpring_cancel_dynamics','SimMechanicsOpenEditorOnUpdate','off');


