classdef Tray < RobotBaseClass

 properties(Access = public)              
        plyFileNameStem = 'Service Tray.ply';
    
 end

 methods
     
     function self = Tray(baseTr)
			self.CreateModel();
            if nargin < 1			
				baseTr = eye(4);				
            end
            self.model.base = self.model.base.T * baseTr * trotx(pi/2) * troty(pi/2);
            
            self.PlotAndColourRobot();  
     end

 end

end