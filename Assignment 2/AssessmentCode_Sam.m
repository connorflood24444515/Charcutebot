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
    




 



