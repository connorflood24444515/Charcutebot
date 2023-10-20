function BeerBottle

    mesh_h = PlaceObject('Beerglass.PLY');
    vertices = get(mesh_h, 'Vertices');

    transformedVertices = [vertices,ones(size(vertices,1),1)]';
    set(mesh_h,'Vertices',transformedVertices(:,1:3));

    scale = 0.002;  %since object was too large upon import, scale of extinguisher was reduced.
    vertices = vertices * scale;

    transformedVertices = [vertices,ones(size(vertices,1),1)] * transl(-1.40, 1.2, -0.8)' * trotx(pi/2)';
    set(mesh_h,'Vertices',transformedVertices(:,1:3));

end


