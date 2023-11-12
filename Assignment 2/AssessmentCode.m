% Defining of figure and clear previous plots
figure(1);
clf;  %clear figure ensure it is all fresh for initialisation
clear; 
pause_simulation = false;


%while(pause-simulation == false)

    % Plot the robot and ensure subsequent plots go to the same figure
   % r1 = LinearUR3;
    disp('LinearUR3 loaded')
   % r3 = ServiceTray;
    disp('Service Tray mounted')
    %r2 = Gofa5;
    %disp('Gofa5 loaded')
    hold on;


%% Import Function commands
    BarEnvironment();
    disp('Bar Background loaded');
    %stopCheck(joy, stop_button);

    disp('Fire Extinguisher loaded');
    disp('Emergency Stop Button loaded');

    Table();
    disp('Table Loaded');
    %stopCheck(joy, stop_button);

    EnvironmentWalls();
    disp('Walls and Floors loaded');
    %stopCheck(joy, stop_button);

    BeerGlasses();
    PlaceSchooner();
    disp('Schooner glass placed');
    %stopCheck(joy, stop_button);

    BeerBottle();
    PlaceBeerBottle();
    disp('Beer bottle placed');
    %stopCheck(joy, stop_button);

    PlaceBarStools();
    disp('Stools placed');
    %stopCheck(joy, stop_button);

    %SafetyFence();
    %PlaceSafetyFence();
    %disp('Safety Fences placed')
    %stopCheck(joy, stop_button);




    axis([-2.5 2.5 -2.5 2.5 -0 2.5]);  %Axis size
    view(3);    % Sets the 3D view for the plot

    %r1.model.base = transl(-0.375,1.2,1.2) * trotx(pi/2) * troty(pi/2);
     %r2.model.base = transl(-0.375,1.2,1.2);


    %MoveBottle();
    %GoFa_Set();

    MoveTray();
    disp('Moving tray')
    disp('Tray moved')

    

    

    % q = zeros(1,7);
   
    % r1.model.animate(q);

    % q1 = zeros(1,7);
    % r2.model.base = transl(-0.375,1.2,1.2) * trotx(pi/2) * troty(pi/2);
    % r2.model.animate(q1);





    



