function PlaceSafetyFence()
    % Fence Translations - lay out fences in simulation (you can adjust these positions)
    translations = [
        0 0.32 0;
        -0.2 0.3 0;
        -0.4 0.3 0;
        % ... Add more positions if needed ...
    ];

    % Plot and create the fences based on their translations
    rotation = eye(3);  % rotation is kept the same
    for i = 1:size(translations, 1)
        transformation_matrix = [rotation, translations(i, :)'; 0, 0, 0, 1];
        SafetyFence(transformation_matrix);
        % Uncomment the next line if you want to visualize the fence positions as points
        % plot3(translations(i, 1), translations(i, 2), translations(i, 3), 'ro'); 
    end
end

