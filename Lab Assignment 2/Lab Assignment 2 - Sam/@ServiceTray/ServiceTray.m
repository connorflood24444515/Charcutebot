% classdef ServiceTray
%     %SERVICETRAY Summary of this class goes here
% 
%     methods
% 
%     function self = ServiceTray()
% 
% 
%     %   Detailed explanation goes here
% 
% 
%             [faceData,vertexData] = plyread('ServiceTray','tri');
%             link1 = Link('alpha',pi/2,'a',0,'d',0.3,'offset',0);
%             tray = SerialLink(link1,'name',name);
% 
%             % Changing order of cell array from {faceData, []} to 
%             % {[], faceData} so that data is attributed to Link 1
%             % in plot3d rather than Link 0 (base).
%             tray.faces = {[], faceData};
% 
%             % Changing order of cell array from {vertexData, []} to 
%             % {[], vertexData} so that data is attributed to Link 1
%             % in plot3d rather than Link 0 (base).
%             tray.points = {[], vertexData};
% 
%             plot3d(self.cowModel{i},0,'workspace',self.workspaceDimensions,'view',[-30,30],'delay',0,'noarrow','nowrist');
% 
% 
%     end
% 
%     end
% 
% end
% 
% 
% 
% 
% tray.model.base = robot.model.fkine
% tray.model.animate(tray.model.getpos)




classdef ServiceTray
    %SERVICETRAY Summary of this class goes here

    properties
        model
        workspaceDimensions = [-0.5,0.5,-0.5,0.5,-0.5,0.5]; % Define as required
    end

    methods

        function self = ServiceTray()

            % Load ply data
            [faceData, vertexData] = plyread('ServiceTray.ply', 'tri');

            % Create a link
            link1 = Link('alpha', pi/2, 'a', 0, 'd', 0, 'offset', 0);

            % Create a SerialLink model
            self.model = SerialLink(link1, 'name', 'ServiceTray');

            % Assign face and vertex data
            self.model.faces = {[], faceData};
            self.model.points = {[], vertexData};

            % Plot the model
            self.model.plot3d(0, 'workspace', self.workspaceDimensions, 'view', [-30, 30], 'delay', 0, 'noarrow', 'nowrist');

           
        end

    end

end


% classdef ServiceTray
%     %SERVICETRAY Represents a service tray object for visualization purposes.
% 
%     properties
%         model                % SerialLink model of the tray
%         workspaceDimensions  % Workspace dimensions for visualization
%     end
% 
%     methods
%         function self = ServiceTray()
%             % Constructor for the ServiceTray class.
% 
%             % Load ply data
%             [faceData, vertexData] = plyread('ServiceTray.ply', 'tri');
% 
%             % Create a link
%             link = Link('alpha', pi/2, 'a', 0, 'd', 0.3, 'offset', 0);
% 
%             % Create a SerialLink model
%             self.model = SerialLink(link, 'name', 'ServiceTray');
% 
%             % Assign face and vertex data
%             self.model.faces = {[], faceData};
%             self.model.points = {[], vertexData};
% 
%             % Plot the model (with initial joint position as 0)
%             self.model.plot3d(0, 'workspace', self.workspaceDimensions, 'view', [-30, 30], 'delay', 0, 'noarrow', 'nowrist');
%         end
% 
%         function setBase(self, robotBaseTransform)
%             % Set the base transformation matrix for the ServiceTray model.
%             % This can be used to position the tray relative to another object, like a robot end-effector.
% 
%             self.model.base = robotBaseTransform;
%         end
% 
%         function animate(self, q)
%             % Animate the tray based on joint angles (q).
%             % Given the tray is a single-link model, q doesn't affect its shape, 
%             % but the method is useful if the base is also being adjusted in conjunction with animation.
% 
%             self.model.animate(q);
%         end
%     end
% end

