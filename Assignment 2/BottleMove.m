% Create a LinearUR3 robot object
baseTransform = transl(0, 0, 0); % Define the base transform
r = LinearUR3;

% Define the target positions
initialEndEffectorPose = transl(0.5, 0.5, 0.2); % Initial end effector pose
pickupLocation = transl(0.6, 0.6, 0.1);         % Location of the object
finalEndLocation = transl(0.7, 0.7, 0.2);      % Final end location

% Use inverse kinematics to move the end effector to the pickup location
q_initial = r.model.getpos(); % Get the current joint configuration

% Manually specify optimization options for fmincon
options = optimset('fmincon');
options.MaxFunctionEvaluations = 500;
options.Display = 'off';

ik_initial = ikine(r.model, pickupLocation, q_initial, 'options', options);
q_pickup = ik_initial; % Make sure q_pickup is a valid joint configuration

if isempty(q_pickup)
    error('Failed to find a suitable joint configuration for the pickup location.');
end

% Move the robot to the pickup location and visualize it
r.model.plot(q_pickup, 'trail', 'r', 'trailcolor', 'r', 'nobase', 'noname');

% Simulate picking up the object (You can replace this part with your custom logic)
disp('Picking up the object...');

% Use inverse kinematics to move the robot to the final end location
ik_final = ikine(r.model, finalEndLocation, q_pickup, 'options', options);
q_final = ik_final; % Make sure q_final is a valid joint configuration

if isempty(q_final)
    error('Failed to find a suitable joint configuration for the final end location.');
end

% Move the robot to the final end location and visualize it
r.model.plot(q_final, 'trail', 'b', 'trailcolor', 'b', 'nobase', 'noname');
