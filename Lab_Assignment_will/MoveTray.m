function MoveTray()


    r1 = LinearUR3;
    r2 = GoFa_15000;
    tray = ServiceTray(); 
    bottle = ServiceBottle(); 

    %bottle = transl(-1.2, 1.1, 1.2);
    r1.model.base = transl(-0.42,-0.3,1.2) * trotx(pi/2) * troty(0);
    r2.model.base = transl(-1.2,0,1);

    q0 = [-0.01 8 74 0 213.45 300 0];
    qf = [-0.01 8 74 0 213.45 300 0];

    q02 = [0 0 0 0 0 0];
    qf2 = [0 0 0 0 -1.75 0];

    steps = 200;
    qPath = jtraj(q0, qf, steps);
    QPath2 = jtraj(q02, qf2, steps);
    
    

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
    QPath2 = jtraj(qf2, q02, steps);

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
    
    
    
    
    
    

    
    
    
    q0 = [-0.01 8 74 0 213.45 300 0];
    qf = [-0.8 10 74 0 213.45 300 0];

    q02 = [40 3 4 7 0 0];
    qf2 = [40 3 4 7 0 0];


    qPath = jtraj(q0, qf, steps);
    QPath2 = jtraj(q02, qf2, steps);
    
   
    for i = 1:steps
        r1.model.animate(qPath(i, :));
        drawnow();

        % Get the end effector's pose from the robot model
        endEffectorPose = r1.model.fkine(qPath(i, :));

        % Update the tray model's pose to match the end effector's pose
        tray.model.base = endEffectorPose;
        tray.model.animate(0); % Update the tray's position
       
        r2.model.animate(QPath2(i, :));

    end

    pause(0);

    % Reverse the motion
    qPath = jtraj(qf, q0, steps);

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
