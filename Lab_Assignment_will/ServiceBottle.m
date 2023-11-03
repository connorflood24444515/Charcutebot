classdef ServiceBottle
    

    properties
        model
        workspaceDimensions = [-3,3,-3,3,-3,3]; % Define as required
        robot
    end

    methods

        function self = ServiceBottle()

             %self.robot = robot; % Store the robot model

            % Load ply data
            [faceData, vertexData] = plyread('BeerBottle.PLY', 'tri');

            scale = 0.002;
            vertexData = vertexData * scale;

            % Create a link
            link1 = Link('alpha', pi/2, 'a', 0, 'd', 0, 'offset', 0);

            % Create a SerialLink model
            self.model = SerialLink(link1, 'name', 'BeerBottle ');

            % Assign face and vertex data
            self.model.faces = {[], faceData};
            self.model.points = {[], vertexData};

            % Plot the model
            self.model.plot3d(0, 'workspace', self.workspaceDimensions, 'view', [-30, 30], 'delay', 0, 'noarrow', 'nowrist');
           
        end

    end

end