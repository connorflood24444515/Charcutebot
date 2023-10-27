function BeerGlasses(transformation_matrix)

if nargin < 1
    transformation_matrix = eye(4); % Default to identity matrix if no argument provided
end

% Load the mesh
mesh_h = PlaceObject('pintglass.ply'); 
vertices = get(mesh_h, 'Vertices');  

% Scale the vertices
scale = 0.002;
vertices = vertices * scale;

% Create a combined transformation matrix
combined_transformation = trotx(pi/2) * transformation_matrix;

% Transform the vertices
transformedVertices = [vertices, ones(size(vertices, 1), 1)] * combined_transformation';
set(mesh_h, 'Vertices', transformedVertices(:, 1:3));

timberColor = [0.6, 0, 0];  % red cup
set(mesh_h, 'FaceColor', timberColor); 
end




% function BeerGlasses(transformation_matrix)
%     mesh_h = PlaceObject('pintglass.PLY');  %place object
%     vertices = get(mesh_h, 'Vertices'); %extract vertices/3D points
% 
%     transformedVertices = [vertices,ones(size(vertices,1),1)]';
%     set(mesh_h,'Vertices',transformedVertices(:,1:3));
% 
%     scale = 0.002;  %since object was too large upon import, scale of extinguisher was reduced.
%     vertices = vertices * scale;
% 
%     transformedVertices = [vertices,ones(size(vertices,1),1)] * transl(0,1.5,0)' * trotx(pi/2)';
%     set(mesh_h,'Vertices',transformedVertices(:,1:3));
% 
%     timberColor = [0.6,0,0];  % red cup
%     set(mesh_h, 'FaceColor', timberColor); 
% end


