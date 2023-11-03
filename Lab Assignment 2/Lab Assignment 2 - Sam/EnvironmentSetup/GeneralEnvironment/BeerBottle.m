function BeerBottle(transformation_matrix3)

if nargin < 1
    transformation_matrix3 = eye(4); % Default to identity matrix if no argument provided
end

    % Load the mesh
    mesh_h = PlaceObject('BeerBottle.PLY');
    vertices = get(mesh_h, 'Vertices');


    scale = 0.002;  %since object was too large upon import, scale of extinguisher was reduced.
    vertices = vertices * scale;


    % Create a combined transformation matrix
    combined_transformation = transformation_matrix3 * trotx(pi/2);

    % Transform the vertices
    transformedVertices = [vertices, ones(size(vertices, 1), 1)] * combined_transformation';
    set(mesh_h, 'Vertices', transformedVertices(:, 1:3));
    end



