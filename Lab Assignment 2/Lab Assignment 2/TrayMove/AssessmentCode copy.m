% Defining of figure and clear previous plots
figure(1);
clf;  %clear figure ensure it is all fresh for initialisation
pause_simulation = false;


%while(pause-simulation == false)

    % Plot the robot and ensure subsequent plots go to the same figure
    %r1 = LinearUR3;
    disp('LinearUR3 loaded')
    %r2 = Gofa5;
    %disp('Gofa5 loaded')
    hold on;







    BarEnvironment();
    disp('Bar Background loaded')
    disp('Fire Extinguisher loaded')
    disp('Emergency Stop Button loaded')
    Table();
    disp('Table Loaded')
    EnvironmentA2();
    disp('Walls and Floors loaded')
    BeerGlasses();
    disp('Schooner glass placed')
    PlaceSchooner();
    BeerBottle();
    disp('Beer bottle placed')




    axis([-2.5 2.5 -2.5 2.5 -0 2.5]);  %Axis size
    view(3);    % Sets the 3D view for the plot

    %r1.model.base = transl(-0.375,1.2,1.2) * trotx(pi/2) * troty(pi/2);


    MoveTray();
    disp('Moving tray')
    disp('Tray moved')


    

    % q = zeros(1,7);
   
    % r1.model.animate(q);

    % q1 = zeros(1,7);
    % r2.model.base = transl(-0.375,1.2,1.2) * trotx(pi/2) * troty(pi/2);
    % r2.model.animate(q1);





    



