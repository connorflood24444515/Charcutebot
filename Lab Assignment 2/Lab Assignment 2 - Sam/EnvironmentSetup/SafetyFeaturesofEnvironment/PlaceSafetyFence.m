function PlaceSafetyFence()
    % Fence Translations - lay out fences in simulation (you can adjust these positions)
    translations = [
        0.4 1.49 -0.8;
        0 1.49 -0.8;
        -0.4 1.49 -0.8;
        -0.8 1.49 -0.8;
        ];

    rotation = eye(3);  % rotation is kept the same
    
    for i = 1:size(translations, 1)
        transformation_matrix4 = [rotation, translations(i, :)'; 0, 0, 0, 1];
        SafetyFence(transformation_matrix4);
    end
end

