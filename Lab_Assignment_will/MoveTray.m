function MoveTray()


    r1 = LinearUR3;
    r2 = GoFa_15000;
    tray = ServiceTray();
    trayed = ServicedTray();
    bottle = ServiceBottle(); 
    glass = ServiceGlass();


    r1.model.base = transl(-0.42,-0.3,1.2) * trotx(pi/2) * troty(0);
    r2.model.base = transl(-1.2,0,1);

    q0 = [-0.01 8 74 0 213.45 300 0];
    qf = [-0.01 8 74 0 213.45 300 0];

    q02 = [0 0 0 0 0 0 0];
    qf2 = [0 1.5 -0.9 -1.6 2.1 0 0];
    %qf3 = [0.03752458 0.9162979 -0.6579891 -0.6544985 1.72788 1.5708 0];
    qf4 = [-0.384533 0.977384 -1.21229 0.3130285 1.92 0 0];
    qf5 = [0.2 1.5 -0.9 -1.6 2 0 0];
    qf6 = [0.8 1.2 -1 -1.5 1.75 0 0];
    steps = 200;
    qPath = jtraj(q0, qf, steps);
    QPath2 = jtraj(q02, qf2, steps);
    
    

    for i = 1:steps
        r1.model.animate(qPath(i, :));
        r2.model.animate(QPath2(i, :));
        drawnow();

        % Get the end effector's pose from the robot model
        % endEffectorPose = r2.model.fkine(QPath2(i, :));
        % 
        % % Update the tray model's pose to match the end effector's pose
        % bottle.model.base = endEffectorPose;
        % bottle.model.animate(0); % Update the tray's position

        % Get the end effector's pose from the robot model
        endEffectorPose = r1.model.fkine(qPath(i, :));

        % Update the tray model's pose to match the end effector's pose
        tray.model.base = endEffectorPose;
        tray.model.animate(0); % Update the tray's position


    end

    pause(0);

    % Reverse the motion
    qPath = jtraj(qf, q0, steps);
    QPath2 = jtraj(qf2, qf4, steps);

     for i = 1:steps
        r1.model.animate(qPath(i, :));
        r2.model.animate(QPath2(i, :));
        drawnow();

        % Get the end effector's pose from the robot model
        endEffectorPose = r2.model.fkine(QPath2(i, :));

        % Update the tray model's pose to match the end effector's pose
        bottle.model.base = endEffectorPose;
        bottle.model.animate(0); % Update the tray's position


        % Get the end effector's pose from the robot model
        endEffectorPose = r1.model.fkine(qPath(i, :));

        % Update the tray model's pose to match the end effector's pose
        tray.model.base = endEffectorPose;
        tray.model.animate(0); % Update the tray's position


    end

    pause(0);
    
    % Reverse the motion
    qPath = jtraj(qf, q0, steps);
    QPath2 = jtraj(qf4, qf2, steps);

     for i = 1:steps
        r1.model.animate(qPath(i, :));
        r2.model.animate(QPath2(i, :));
        drawnow();

        % Get the end effector's pose from the robot model
        endEffectorPose = r2.model.fkine(QPath2(i, :));

        % Update the tray model's pose to match the end effector's pose
        bottle.model.base = endEffectorPose;
        bottle.model.animate(0); % Update the tray's position


        % Get the end effector's pose from the robot model
        endEffectorPose = r1.model.fkine(qPath(i, :));

        % Update the tray model's pose to match the end effector's pose
        tray.model.base = endEffectorPose;
        tray.model.animate(0); % Update the tray's position


    end

    pause(0);
    
    % Reverse the motion
    qPath = jtraj(qf, q0, steps);
    QPath2 = jtraj(qf2, qf5, steps);

     for i = 1:steps
        r1.model.animate(qPath(i, :));
        r2.model.animate(QPath2(i, :));
        drawnow();    

        % Get the end effector's pose from the robot model
        endEffectorPose = r1.model.fkine(qPath(i, :));

        % Update the tray model's pose to match the end effector's pose
        tray.model.base = endEffectorPose;
        tray.model.animate(0); % Update the tray's position


    end

    pause(0);

    
    % Reverse the motion
    qPath = jtraj(qf, q0, steps);
    QPath2 = jtraj(qf5, qf6, steps);

     for i = 1:steps
        r1.model.animate(qPath(i, :));
        r2.model.animate(QPath2(i, :));
        drawnow();

        % Get the end effector's pose from the robot model
        endEffectorPose = r2.model.fkine(QPath2(i, :));

        % Update the tray model's pose to match the end effector's pose
        glass.model.base = endEffectorPose;
        glass.model.animate(0); % Update the tray's position


        % Get the end effector's pose from the robot model
        endEffectorPose = r1.model.fkine(qPath(i, :));

        % Update the tray model's pose to match the end effector's pose
        tray.model.base = endEffectorPose;
        tray.model.animate(0); % Update the tray's position


    end

    pause(0);
    
    








    
    
    
    q0 = [-0.01 8 74 0 213.45 300 0];
    qf = [-0.8 10 74 0 213.45 300 0];


    qPath = jtraj(q0, qf, steps);
    QPath2 = jtraj(qf6, q02, steps);
    
   
    for i = 1:steps
        r1.model.animate(qPath(i, :));
        drawnow();       

        % Get the end effector's pose from the robot model
        endEffectorPose = r1.model.fkine(qPath(i, :));

        % Update the tray model's pose to match the end effector's pose
        glass.model.base = endEffectorPose;
        glass.model.animate(0); % Update the tray's position

        % Update the tray model's pose to match the end effector's pose
        trayed.model.base = endEffectorPose;
        trayed.model.animate(0); % Update the tray's position
       
        r2.model.animate(QPath2(i, :));

    end

    pause(0);

    % Reverse the motion
    qPath = jtraj(qf, q0, steps);
     QPath2 = jtraj(q02, q02, steps);

    for i = 1:steps
        r1.model.animate(qPath(i, :));
        drawnow();

        endEffectorPose = r1.model.fkine(qPath(i, :));
        tray.model.base = endEffectorPose;
        tray.model.animate(0);
       
         r2.model.animate(QPath2(i, :));
    end

    pause(0);

end
