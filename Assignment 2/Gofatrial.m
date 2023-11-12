
% Define the DH parameters
            L(1) = Link('d',0.15185,'a',0,'alpha',pi/2,'qlim',deg2rad([-360 360]), 'offset',0);
            L(2) = Link('d',0,'a',-0.24355,'alpha',0,'qlim', deg2rad([-360 360]), 'offset',0);
            L(3) = Link('d',0,'a',-0.2132,'alpha',0,'qlim', deg2rad([-360 360]), 'offset', 0);
            L(4) = Link('d',0.13105,'a',0,'alpha',pi/2,'qlim',deg2rad([-360 360]),'offset', 0);
            L(5) = Link('d',0.08535,'a',0,'alpha',-pi/2,'qlim',deg2rad([-360,360]), 'offset',0);
            L(6) = Link('d',	0.0921,'a',0,'alpha',0,'qlim',deg2rad([-360,360]), 'offset', 0);


    robot = SerialLink(L, 'name', '6-DOF Planar Robot');


    robot.teach();
% Define the joint angles

%q =  [60*(pi/180), -60*(pi/180), 55*(pi/180), -60*(pi/180), 0, 0];


%T = robot.fkine(q);

%end_effector_position = T.t;
%disp('End Effector Position: ');
%disp(end_effector_position);