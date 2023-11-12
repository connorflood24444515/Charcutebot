function PlaceSchooner()

    translations = [
        -1 1.2 1.1;
        -1 1.2 -1.1;
    ];

    % Plot and create the bricks based on their translations
    rotation = eye(3);   % Identity rotation matrix

    for i = 1:size(translations, 1)  % Iterate over each translation row
        transformation_matrix = [rotation, translations(i, :)'; 0, 0, 0, 1];  % Construct the transformation matrix
        BeerGlasses(transformation_matrix);  % Call function to place the beer glass at the specified location
    end

end



% function Placebevy()
% 
% translations = [
%     -1.45 0.6 1.2;
%     -1.45 0.5 1.2;
% 
% ];
% 
% % Plot and create the bricks based on their translations
% rotation = eye(3);   %rotation is kept as same
% for i = 1:size(translations, 1)  %iterate over rows
%     transformation_matrix = [rotation, translations(i, :)'; 0, 0, 0, 1];
%     BeerGlasses(transformation_matrix);  %call function
%     %plot3(translations(i, 1), translations(i, 2), translations(i, 3), 'ro');  % Plotting bricks as red points
% end
% end

