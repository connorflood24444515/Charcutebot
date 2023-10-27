function BarEnvironment()

Bar = imread('barbackground.png');  %read png file
Bar = imrotate(Bar, 180);

% Define fence boundaries
x_min = -1.49; x_max = 1;
y_min = -1.5; y_max = 1.5;
z_min = 0;    z_max = 2;

% Display fence image on each side
surface([x_min, x_min; x_min, x_min], ...    %maps all corners of the fence with its respected x,y,z
        [y_min, y_max; y_min, y_max], ...
        [z_min, z_min; z_max, z_max], ...
        'CData', Bar, 'FaceColor', 'texturemap');   %Takes data of fence for colour and surface and use as texture map






   %Fire Extinguisher
    mesh_h = PlaceObject('Extinguisher.ply');
    vertices = get(mesh_h, 'Vertices');

    transformedVertices = [vertices,ones(size(vertices,1),1)]';
    set(mesh_h,'Vertices',transformedVertices(:,1:3));

    scale = 0.002;  %since object was too large upon import, scale of extinguisher was reduced.
    vertices = vertices * scale;

    transformedVertices = [vertices,ones(size(vertices,1),1)] * transl(1.30,-0.5,-1.35)' * trotx(pi/2)';
    set(mesh_h,'Vertices',transformedVertices(:,1:3));

    ExtinguisherColour = [0.9, 0.2, 0.2];  % RGB for a type of timber brown
    set(mesh_h, 'FaceColor', ExtinguisherColour); 


    %Emergency stop button
    mesh_h = PlaceObject('EmergencyStop.ply');
    vertices = get(mesh_h, 'Vertices');

    transformedVertices = [vertices,ones(size(vertices,1),1)]';
    set(mesh_h,'Vertices',transformedVertices(:,1:3));

    scale = 0.002;  %since object was too large upon import, scale of extinguisher was reduced.
    vertices = vertices * scale;

    transformedVertices = [vertices,ones(size(vertices,1),1)] * transl(0.1,1.5,-1.49)' * trotx(pi/2)';
    set(mesh_h,'Vertices',transformedVertices(:,1:3));





    %Emergency stop button





    % mesh_h = PlaceObject('Extinguisher.ply');  %place object
    % axis equal
    % vertices = get(mesh_h,'Vertices');  %Extracts verties/3D coordinates
    % 
    % scale = 0.001;  %since object was too large upon import, scale of extinguisher was reduced.
    % vertices = vertices * scale;
    % 
    % 
    % 
    % transformedVertices2 = [vertices,ones(size(vertices,1),1)] * trotx(-pi/2) *transl(1.3, 1.3, -0.2)';  %create column vector to produce homogenous and allow for rotation and translation of extinguisher
    % set(mesh_h2,'Vertices',transformedVertices2(:,1:3));  %updates vertices
    % 
    % set(mesh_h2, 'FaceAlpha', 1);  %allows view of extinguisher to not be transparent

end

