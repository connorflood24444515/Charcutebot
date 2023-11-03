classdef Gofa5 < RobotBaseClass
    %%
    properties(Access = public)              
        Gofa5name = 'Gofa5';
        
        
    end
    
    methods
%% Define robot Function 
        function self = Gofa5(baseTr)
            if nargin < 1			
                baseTr = eye(4);				
            end
            self.CreateModel(baseTr); 
            
                    
        end

%% Create the robot model
        function CreateModel(self, baseTr)   
            %Created Gofa5 robot
            L(1) = Link('d',0.15185,'a',0,'alpha',pi/2,'qlim',deg2rad([-360 360]), 'offset',0);
            L(2) = Link('d',0,'a',-0.24355,'alpha',0,'qlim', deg2rad([-360 360]), 'offset',0);
            L(3) = Link('d',0,'a',-0.2132,'alpha',0,'qlim', deg2rad([-360 360]), 'offset', 0);
            L(4) = Link('d',0.13105,'a',0,'alpha',pi/2,'qlim',deg2rad([-360 360]),'offset', 0);
            L(5) = Link('d',0.08535,'a',0,'alpha',-pi/2,'qlim',deg2rad([-360,360]), 'offset',0);
            L(6) = Link('d',	0.0921,'a',0,'alpha',0,'qlim',deg2rad([-360,360]), 'offset', 0);

            
            % Incorporate joint limits
            % Updating qlim for gofa 5 robot
            L(1).qlim = [-180 180]*pi/180;           % Axis 1 rotation
            L(2).qlim = [-180 180]*pi/180;           % Axis 2 arm
            L(3).qlim = [-225 85]*pi/180;            % Axis 3 arm
            L(4).qlim = [-180 180]*pi/180;           % Axis 4 wrist
            L(5).qlim = [-180 180]*pi/180;           % Axis 5 bend
            L(6).qlim = [-270 270]*pi/180;           % Axis 6 turn

            

            self.model = SerialLink(L, 'name', self.Gofa5name);
            
            
            self.model.teach();
 

            
            
        end
     
    end
end
