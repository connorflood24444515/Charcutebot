function BarStools(transformation_matrix2)
if nargin < 1
    transformation_matrix2 = eye(4); % Default to identity matrix if no argument provided
end

% Load the mesh
mesh_h = PlaceObject('BarStool.PLY'); 
vertices = get(mesh_h, 'Vertices');  

% Scale the vertices
scale = 0.0015;
vertices = vertices * scale;

% Create a combined transformation matrix
combined_transformation = transformation_matrix2;

% Transform the vertices
transformedVertices = [vertices, ones(size(vertices, 1), 1)] * combined_transformation';
set(mesh_h, 'Vertices', transformedVertices(:, 1:3));
end


