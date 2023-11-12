function Test_a()
    
    r1 = GoFa_15000;

    r1.model.base = transl(-0.375,1.2,1.2) * trotx(pi/2) * troty(pi/2);

    q0 = [11 74 0 213.45 300 0];
    qf = [8 74 0 213.45 300 0];

    steps = 200;
    qPath = jtraj(q0, qf, steps);

    % Create a TrayObject and initialize its position
    tray = ServiceTray(); % Pass the robot model

    for i = 1:steps
        r1.model.animate(qPath(i, :));
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

    for i = 1:steps
        r1.model.animate(qPath(i, :));
        drawnow();

        endEffectorPose = r1.model.fkine(qPath(i, :));
        tray.model.base = endEffectorPose;
        tray.model.animate(0);
    end

    pause(0);

end