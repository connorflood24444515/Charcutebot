classdef TrayObject
    properties
        position
        model  % Add the model property
    end
    
    methods
        % Constructor method to create a TrayObject
        function obj = TrayObject(initialPosition)
            if nargin > 0
                obj.position = initialPosition;
            else
                obj.position = [0, 0, 0];  % Default initial position
            end
        end
        
        % Method to set the position
        function setPosition(obj, newPosition)
            % Check if newPosition is a valid 3-element vector
            if isequal(size(newPosition), [1, 3])
                obj.position = newPosition;
                % Update the position of the model if it exists
                if ~isempty(obj.model)
                    obj.model.base = transl(newPosition);
                end
            else
                error('Invalid position. The position must be a 3-element vector [x, y, z].');
            end
        end
        
        % Method to get the position
        function currentPosition = getPosition(obj)
            currentPosition = obj.position;
        end

        % Method to get the tray model
        function model = GetTrayModel(obj, name)
            if nargin < 1
                name = 'Tray';
            end
            
            % Load the mesh file 'Service Tray.ply'
            [faceData, vertexData] = plyread('Service Tray.ply', 'tri');
            
            if isempty(faceData) || isempty(vertexData)
                error('Failed to load the tray mesh file.');
            end
            
            % Create a SerialLink robot model for the tray
            link1 = Link('alpha', pi/2, 'a', 0, 'd', 0.3, 'offset', 0);
            model = SerialLink(link1, 'name', name);
            
            % Set the mesh data for visualization
            model.faces = {[], faceData};
            model.points = {[], vertexData};
            
            obj.model = model;  % Associate the model with the TrayObject
        end
    end
end
