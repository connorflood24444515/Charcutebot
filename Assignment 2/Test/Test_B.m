function Test_B()
    tray = PlaceObject('Service Tray.ply');

    r = LinearUR3;

    q0 =  ([-0.8 100 70 50 60 68 0]);
    qf  =  ([-0.01 100 70 50 60 70 0]);
    steps = 200;

    qPath = jtraj(q0, qf, steps);

    % Create a 3D scene
    figure;
    r.model.plot(q0, 'noa', 'workspace', [-1, 1, -1, 1, 0, 2]);
    hold on;

    for i = 1:steps
        r.model.animate(qPath(i,:));
        
        % Calculate the end effector transformation
        endEffectorT = r.model.fkine(r.model.getpos());

        % Update the 'tray' object's position and orientation
        tray_T = endEffectorT * transl(0, 0, 0); % Adjust the translation as needed
        tray.base = tray_T;

        % Pause to control animation speed
        pause(0.1);  % Adjust the pause duration as needed
    end

    pause(0);

    qPath = jtraj(qf, q0, steps);

    for i = 1:steps
        r.model.animate(qPath(i,:));
        
        % Calculate the end effector transformation
        endEffectorT = r.model.fkine(r.model.getpos());

        % Update the 'tray' object's position and orientation
        tray_T = endEffectorT * transl(0, 0, 0); % Adjust the translation as needed
        tray.base = tray_T;

        % Pause to control animation speed
        pause(0.1);  % Adjust the pause duration as needed
    end
end
