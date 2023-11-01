function PlaceBeerBottle
    translations = [
        -1.2, 1.1, 1.2;
        -1.2, -1.1, 1.2;
    ];

    % Plot and create the bricks based on their translations
    rotation = eye(3);   % Identity rotation matrix

    for i = 1:size(translations, 1)  % Iterate over each translation row
        transformation_matrix3 = [rotation, translations(i, :)'; 0, 0, 0, 1];  % Construct the transformation matrix
        BeerBottle(transformation_matrix3);  % Call function to place the beer glass at the specified location
    end

end

