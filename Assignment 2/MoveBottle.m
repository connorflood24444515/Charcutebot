function MoveBottle()
    
    r1 = GoFa_15000;

    r1.model.base = transl(-0.8,1.2,1.2);

    % q0 = [0 0 0 0 0 0];
    % qf = [0 1 0 0 0 0];
    % steps = 200;
    % qPath = jtraj(q0, qf, steps);
    % %qPath = jtraj(r1.model.qlim(:,1)',r1.model.qlim(:,2)',1000);
    % 
    % % Create a TrayObject and initialize its position
    % %bottle = BeerBottle(); % Pass the robot model
    % 
    % for i = 1:steps
    %     r1.model.animate(qPath(i, :));
    %     drawnow();
    % 
    %     % Get the end effector's pose from the robot model
    %     %endEffectorPose = r1.model.fkine(qPath(i, :));
    % 
    %     % Update the tray model's pose to match the end effector's pose
    %     % bottle.model.base = endEffectorPose;
    %     % bottle.model.animate(0); % Update the tray's position
    % end
    % 
    % pause(0);
    % 
    % % Reverse the motion
    % qPath = jtraj(qf, q0, steps);
    % 
    % for i = 1:steps
    %     r1.model.animate(qPath(i, :));
    %     drawnow();
    % 
    %     % endEffectorPose = r1.model.fkine(qPath(i, :));
    %     % bottle.model.base = endEffectorPose;
    %     % bottle.model.animate(0);
    % end
    % 
    % pause(0);

end
