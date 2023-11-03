%% initialise
rosinit('192.168.27.1'); % If unsure, please ask a tutor
jointStateSubscriber = rossubscriber('joint_states','sensor_msgs/JointState');

%% 
[gripperPub, gripperMsg] = rospublisher('/onrobot_rg2/joint_position_controller/command');

%% curent joint state
jointStateSubscriber = rossubscriber('joint_states','sensor_msgs/JointState');

pause(2); % Pause to give time for a message to appear


%% gripper set pos
pause(1)

gripperMsg.Data = -0.5; %fully open
send(gripperPub,gripperMsg);

pause(1)


%% joint pos
currentJointState_321456 = (jointStateSubscriber.LatestMessage.Position)'; % Note the default order of the joints is 3,2,1,4,5,6
currentJointState_123456 = [currentJointState_321456(3:-1:1),currentJointState_321456(4:6)];



jointStateSubscriber.LatestMessage


jointNames = {'shoulder_pan_joint','shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint'};


[client, goal] = rosactionclient('/scaled_pos_joint_traj_controller/follow_joint_trajectory');
goal.Trajectory.JointNames = jointNames;
goal.Trajectory.Header.Seq = 1;
goal.Trajectory.Header.Stamp = rostime('Now','system');
goal.GoalTimeTolerance = rosduration(0.05);
bufferSeconds = 1; % This allows for the time taken to send the message. If the network is fast, this could be reduced.
durationSeconds = 5; % This is how many seconds the movement will take

startJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');
startJointSend.Positions = currentJointState_123456;
startJointSend.TimeFromStart = rosduration(0);     
      
endJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');



nextJointState_123456 =  [0.0000   -0.6283    1.2566   -0.6283    1.6336    0.0000];  %pick up beer bottle
endJointSend.Positions = nextJointState_123456;
endJointSend.TimeFromStart = rosduration(durationSeconds);

goal.Trajectory.Points = [startJointSend; endJointSend];

%% sends it to the robot.
goal.Trajectory.Header.Stamp = jointStateSubscriber.LatestMessage.Header.Stamp + rosduration(bufferSeconds);
sendGoal(client,goal);


%% gripper
pause(1)

gripperMsg.Data = 0.2;
send(gripperPub,gripperMsg);

pause(1)



%% joint pos
currentJointState_321456 = (jointStateSubscriber.LatestMessage.Position)'; % Note the default order of the joints is 3,2,1,4,5,6
currentJointState_123456 = [currentJointState_321456(3:-1:1),currentJointState_321456(4:6)];



jointStateSubscriber.LatestMessage


jointNames = {'shoulder_pan_joint','shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint'};


[client, goal] = rosactionclient('/scaled_pos_joint_traj_controller/follow_joint_trajectory');
goal.Trajectory.JointNames = jointNames;
goal.Trajectory.Header.Seq = 1;
goal.Trajectory.Header.Stamp = rostime('Now','system');
goal.GoalTimeTolerance = rosduration(0.05);
bufferSeconds = 1; % This allows for the time taken to send the message. If the network is fast, this could be reduced.
durationSeconds = 5; % This is how many seconds the movement will take

startJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');
startJointSend.Positions = currentJointState_123456;
startJointSend.TimeFromStart = rosduration(0);     
      
endJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');




nextJointState_123456 =  [0.2513   -0.6283    0.5027    0.1257    1.6336   -1.6336];  %pour beer bottle into schooner glass
endJointSend.Positions = nextJointState_123456;
endJointSend.TimeFromStart = rosduration(durationSeconds);

goal.Trajectory.Points = [startJointSend; endJointSend];

%% sends it to the robot.

goal.Trajectory.Header.Stamp = jointStateSubscriber.LatestMessage.Header.Stamp + rosduration(bufferSeconds);
sendGoal(client,goal);





%% joint pos
currentJointState_321456 = (jointStateSubscriber.LatestMessage.Position)'; % Note the default order of the joints is 3,2,1,4,5,6
currentJointState_123456 = [currentJointState_321456(3:-1:1),currentJointState_321456(4:6)];



jointStateSubscriber.LatestMessage


jointNames = {'shoulder_pan_joint','shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint'};


[client, goal] = rosactionclient('/scaled_pos_joint_traj_controller/follow_joint_trajectory');
goal.Trajectory.JointNames = jointNames;
goal.Trajectory.Header.Seq = 1;
goal.Trajectory.Header.Stamp = rostime('Now','system');
goal.GoalTimeTolerance = rosduration(0.05);
bufferSeconds = 1; % This allows for the time taken to send the message. If the network is fast, this could be reduced.
durationSeconds = 5; % This is how many seconds the movement will take

startJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');
startJointSend.Positions = currentJointState_123456;
startJointSend.TimeFromStart = rosduration(0);     
      
endJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');




nextJointState_123456 =  [0.2513   -0.7540    0.6283    0.1257    1.6336   -2.7646]; %provide extra tilt and lift
endJointSend.Positions = nextJointState_123456;
endJointSend.TimeFromStart = rosduration(durationSeconds);

goal.Trajectory.Points = [startJointSend; endJointSend];

%% sends it to the robot.
goal.Trajectory.Header.Stamp = jointStateSubscriber.LatestMessage.Header.Stamp + rosduration(bufferSeconds);
sendGoal(client,goal);




%% joint pos
currentJointState_321456 = (jointStateSubscriber.LatestMessage.Position)'; % Note the default order of the joints is 3,2,1,4,5,6
currentJointState_123456 = [currentJointState_321456(3:-1:1),currentJointState_321456(4:6)];



jointStateSubscriber.LatestMessage


jointNames = {'shoulder_pan_joint','shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint'};


[client, goal] = rosactionclient('/scaled_pos_joint_traj_controller/follow_joint_trajectory');
goal.Trajectory.JointNames = jointNames;
goal.Trajectory.Header.Seq = 1;
goal.Trajectory.Header.Stamp = rostime('Now','system');
goal.GoalTimeTolerance = rosduration(0.05);
bufferSeconds = 1; % This allows for the time taken to send the message. If the network is fast, this could be reduced.
durationSeconds = 5; % This is how many seconds the movement will take

startJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');
startJointSend.Positions = currentJointState_123456;
startJointSend.TimeFromStart = rosduration(0);     
      
endJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');




nextJointState_123456 =  [0.0000   -0.6283    1.2566   -0.6283    1.6336    0.0000];  %drop beer bottle
endJointSend.Positions = nextJointState_123456;
endJointSend.TimeFromStart = rosduration(durationSeconds);

goal.Trajectory.Points = [startJointSend; endJointSend];

%% sends it to the robot.
goal.Trajectory.Header.Stamp = jointStateSubscriber.LatestMessage.Header.Stamp + rosduration(bufferSeconds);
sendGoal(client,goal);

%% gripper set pos
pause(1)

gripperMsg.Data = -0.5;
send(gripperPub,gripperMsg);

pause(1)


%% joint pos
currentJointState_321456 = (jointStateSubscriber.LatestMessage.Position)'; % Note the default order of the joints is 3,2,1,4,5,6
currentJointState_123456 = [currentJointState_321456(3:-1:1),currentJointState_321456(4:6)];



jointStateSubscriber.LatestMessage


jointNames = {'shoulder_pan_joint','shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint'};


[client, goal] = rosactionclient('/scaled_pos_joint_traj_controller/follow_joint_trajectory');
goal.Trajectory.JointNames = jointNames;
goal.Trajectory.Header.Seq = 1;
goal.Trajectory.Header.Stamp = rostime('Now','system');
goal.GoalTimeTolerance = rosduration(0.05);
bufferSeconds = 1; % This allows for the time taken to send the message. If the network is fast, this could be reduced.
durationSeconds = 5; % This is how many seconds the movement will take

startJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');
startJointSend.Positions = currentJointState_123456;
startJointSend.TimeFromStart = rosduration(0);     
      
endJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');




nextJointState_123456 =  [0 -pi/2 0 -pi/2 0 0];  %reset
endJointSend.Positions = nextJointState_123456;
endJointSend.TimeFromStart = rosduration(durationSeconds);

goal.Trajectory.Points = [startJointSend; endJointSend];

%% sends it to the robot.
goal.Trajectory.Header.Stamp = jointStateSubscriber.LatestMessage.Header.Stamp + rosduration(bufferSeconds);
sendGoal(client,goal);







%% joint pos
currentJointState_321456 = (jointStateSubscriber.LatestMessage.Position)'; % Note the default order of the joints is 3,2,1,4,5,6
currentJointState_123456 = [currentJointState_321456(3:-1:1),currentJointState_321456(4:6)];



jointStateSubscriber.LatestMessage


jointNames = {'shoulder_pan_joint','shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint'};


[client, goal] = rosactionclient('/scaled_pos_joint_traj_controller/follow_joint_trajectory');
goal.Trajectory.JointNames = jointNames;
goal.Trajectory.Header.Seq = 1;
goal.Trajectory.Header.Stamp = rostime('Now','system');
goal.GoalTimeTolerance = rosduration(0.05);
bufferSeconds = 1; % This allows for the time taken to send the message. If the network is fast, this could be reduced.
durationSeconds = 5; % This is how many seconds the movement will take

startJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');
startJointSend.Positions = currentJointState_123456;
startJointSend.TimeFromStart = rosduration(0);     
      
endJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');




nextJointState_123456 =  [0.2513   -0.5027    1.0053   -0.5027    1.6336    0.0000];  %pick up schooner
endJointSend.Positions = nextJointState_123456;
endJointSend.TimeFromStart = rosduration(durationSeconds);

goal.Trajectory.Points = [startJointSend; endJointSend];

%% sends it to the robot.
goal.Trajectory.Header.Stamp = jointStateSubscriber.LatestMessage.Header.Stamp + rosduration(bufferSeconds);
sendGoal(client,goal);



%% gripper set pos
pause(1)

gripperMsg.Data = 0.2;
send(gripperPub,gripperMsg);

pause(1)





%% joint pos
currentJointState_321456 = (jointStateSubscriber.LatestMessage.Position)'; % Note the default order of the joints is 3,2,1,4,5,6
currentJointState_123456 = [currentJointState_321456(3:-1:1),currentJointState_321456(4:6)];



jointStateSubscriber.LatestMessage


jointNames = {'shoulder_pan_joint','shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint'};


[client, goal] = rosactionclient('/scaled_pos_joint_traj_controller/follow_joint_trajectory');
goal.Trajectory.JointNames = jointNames;
goal.Trajectory.Header.Seq = 1;
goal.Trajectory.Header.Stamp = rostime('Now','system');
goal.GoalTimeTolerance = rosduration(0.05);
bufferSeconds = 1; % This allows for the time taken to send the message. If the network is fast, this could be reduced.
durationSeconds = 5; % This is how many seconds the movement will take

startJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');
startJointSend.Positions = currentJointState_123456;
startJointSend.TimeFromStart = rosduration(0);     
      
endJointSend = rosmessage('trajectory_msgs/JointTrajectoryPoint');




nextJointState_123456 =  [-2.3876   -1.1310    1.6336   -0.5027    1.6336    0.0000];  %place schooner on service tray
endJointSend.Positions = nextJointState_123456;
endJointSend.TimeFromStart = rosduration(durationSeconds);

goal.Trajectory.Points = [startJointSend; endJointSend];

%% sends it to the robot.
goal.Trajectory.Header.Stamp = jointStateSubscriber.LatestMessage.Header.Stamp + rosduration(bufferSeconds);
sendGoal(client,goal);

