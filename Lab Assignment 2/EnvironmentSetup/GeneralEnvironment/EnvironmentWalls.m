function EnvironmentWalls()

    % Define environment parameters
    x_axis = 2;  
    y_axis = 1.5;
    wallHeight = 2; % Height of the wall

    % Plot the floor
    fill3([x_axis, -x_axis, -x_axis, x_axis], [y_axis, y_axis, -y_axis, -y_axis], [0, 0, 0, 0], [0 0 0]);   %sets 4 corners for each floor and wall

    % Plot the walls
    % Front Wall (along +Y axis)
    fill3([x_axis, -x_axis, -x_axis, x_axis], [y_axis, y_axis, y_axis, y_axis], [0, 0, wallHeight, wallHeight], [0.5 0.5 0.5]);

    % Back Wall (along -Y axis)
    fill3([x_axis, -x_axis, -x_axis, x_axis], [-y_axis, -y_axis, -y_axis, -y_axis], [0, 0, wallHeight, wallHeight], [0.5 0.5 0.5]);

    % Left Wall (along -X axis)
    fill3([-x_axis, -x_axis, -x_axis, -x_axis], [y_axis, -y_axis, -y_axis, y_axis], [0, 0, wallHeight, wallHeight], [0.5 0.5 0.5]);

    % Right Wall (along +X axis)
    fill3([x_axis, x_axis, x_axis, x_axis], [y_axis, -y_axis, -y_axis, y_axis], [0, 0, wallHeight, wallHeight], [0.5 0.5 0.5]);
end

