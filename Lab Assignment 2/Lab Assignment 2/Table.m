function Table()
    mesh_h = PlaceObject('Tablesmallv2.PLY');
    vertices = get(mesh_h, 'Vertices');

    transformedVertices = [vertices,ones(size(vertices,1),1)]';
    set(mesh_h,'Vertices',transformedVertices(:,1:3));

    scale = 0.01;  %since object was too large upon import, scale of extinguisher was reduced.
    vertices = vertices * scale;

    transformedVertices = [vertices,ones(size(vertices,1),1)] * transl(-1.15,0,-0.5)' * trotx(pi/2)';
    set(mesh_h,'Vertices',transformedVertices(:,1:3));

    timberColor = [139/255, 69/255, 19/255];  % RGB for a type of timber brown
    set(mesh_h, 'FaceColor', timberColor); 
end

