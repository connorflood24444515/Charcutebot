function SafetyFence(transformation_matrix)
    % Load the fence mesh
    mesh_h = PlaceObject('ColouredSafetyFence.PLY'); 
    vertices = get(mesh_h, 'Vertices');
    
    transformedVertices = [vertices,ones(size(vertices,1),1)]';
    set(mesh_h,'Vertices',transformedVertices(:,1:3));

    scale = 0.001;  %since object was too large upon import, scale of extinguisher was reduced.
    vertices = vertices * scale;

    transformedVertices = [vertices,ones(size(vertices,1),1)] * trotx(pi/2) * transl(1,1,1)';
    set(mesh_h,'Vertices',transformedVertices(:,1:3));

end
 






%{
    mesh_h = PlaceObject('SafetyFence.PLY');
    vertices = get(mesh_h, 'Vertices');

    transformedVertices = [vertices,ones(size(vertices,1),1)]';
    set(mesh_h,'Vertices',transformedVertices(:,1:3));

    FenceColour = [0.99, 0.99, 0];  % RGB to produce yellow fence
    set(mesh_h, 'FaceColor', FenceColour); 
%}


