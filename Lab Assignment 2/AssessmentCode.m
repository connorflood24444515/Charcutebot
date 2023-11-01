% Defining of figure and clear previous plots
figure(1);
clf;  %clear figure ensure it is all fresh for initialisation
pause_simulation = false;



%while(pause-simulation == false)

    % Plot the robot and ensure subsequent plots go to the same figure
    r1 = LinearUR3;
    disp('LinearUR3 loaded')
    r3 = ServiceTray;
    disp('Service Tray mounted')
    %r2 = Gofa5;
    %disp('Gofa5 loaded')
    hold on;







    BarEnvironment();
    disp('Bar Background loaded')
    disp('Fire Extinguisher loaded')
    disp('Emergency Stop Button loaded')
    Table();
    disp('Table Loaded')
    EnvironmentWalls();
    disp('Walls and Floors loaded')
    BeerGlasses();
    PlaceSchooner();
    disp('Schooner glass placed')
    BeerBottle();
    PlaceBeerBottle();
    disp('Beer bottle placed')
    PlaceBarStools();
    disp('Stools placed')
    SafetyFence();
    




 
    q = zeros(1,8);
    r1.model.base = transl(-0.42,-0.3,1.2) * trotx(pi/2) * troty(0);
    r1.model.animate(q);










    

%     %new iteration
%     q_initial = zeros(1,7);
% 
%     % Set r3's base to r1's end effector position and animate
%     r3.model.base = r1.model.fkine(q_initial);
%     r3.model.animate(r3.model.getpos);
% 
% % Define the trajectory for r1's movement
%     qMatrix = jtraj(q_initial, [pi/4,pi/4,pi/4,pi/4,pi/4,pi/4,pi/4], 50);
% 
% for i = 1:50
%     % Animate r1's movement
%     r1.model.animate(qMatrix(i,:));
% 
%     % Update r3's base position to r1's end effector position and animate
%     r3.model.base = r1.model.fkine(qMatrix(i,:));
%     r3.model.animate(r3.model.getpos);
% 
%     drawnow()
% end





%first iteration

    % %new
    % r1.model.animate([0,0,0,0,0,0,0]);
    % %
    % 
    % 
    r3.model.base = r1.model.fkine([0,0,0,0,0,0,0]);
    r3.model.animate(r3.model.getpos);
    qMatrix = jtraj([0,0,0,0,0,0,0],[0,0,0,0,0,0,0],50);

    for i = 1:50
        %new
        %r1.model.animate(qMatrix(i,:));
        %
        r3.model.base = r1.model.fkine(qMatrix(i,:));
        r3.model.animate(r3.model.getpos);
        drawnow()
    end







  

    % q1 = zeros(1,7);
    % r2.model.base = transl(-0.375,1.2,1.2) * trotx(pi/2) * troty(pi/2);
    % r2.model.animate(q1);





    axis([-2 2 -2 2 0 2]);  %Axis size
    view(3);    % Sets the 3D view for the plot





