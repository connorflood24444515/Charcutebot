%% Defining of figure and clear previous plots
figure(1);
clf;  %clear figure ensure it is all fresh for initialisation


%%Initialise controller
% id = 1; % NOTE: may need to change if multiple joysticks present
% 
% joy = vrjoystick(id);
% joy_info = caps(joy); % print joystick information
% 
% 
% fprintf('Your joystick has:\n');
% fprintf(' - %i buttons\n',joy_info.Buttons);
% fprintf(' - %i axes\n', joy_info.Axes);
% pause(2);

%% Initialise stop button
% Define the button to stop the loop
% stop_button = 1;

    

%% Plot Robots and classes

    % Plot the Linear UR3
    r1 = LinearUR3;
    disp('LinearUR3 loaded')
    %stopCheck(joy, stop_button); 
    
    %Plot ABB Gofa 10
    %r2 = Gofa5;
    %disp('Gofa5 loaded')
    
    %Plot Service Tray
    r3 = ServiceTray;
    disp('Service Tray mounted')
    %stopCheck(joy, stop_button);
    
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

    SafetyFence();
    PlaceSafetyFence();
    disp('Safety Fences placed')
    %stopCheck(joy, stop_button);





    q = zeros(1,8);
    r1.model.base = transl(-0.42,-0.3,1.2) * trotx(pi/2) * troty(0);
    r1.model.animate(q);
    %stopCheck(joy, stop_button);

    r3.model.base = r1.model.fkine([0,0,0,0,0,0,0]);
    r3.model.animate(r3.model.getpos);
    qMatrix = jtraj([0,0,0,0,0,0,0],[0,0,0,0,0,0,0],50);

    for i = 1:50
        r3.model.base = r1.model.fkine(qMatrix(i,:));
        r3.model.animate(r3.model.getpos);
        drawnow();

        %stopCheck(joy, stop_button); % Allows to stop even within this loop
    end

    pause(0.1);

    % Cleaning up at the end
    %clear joy;

    % Set axis and view
    axis([-2 2 -2 2 0 2]);  % Axis size
    view(3);  % Sets the 3D view for the plot


%     function stopCheck(joy, stop_button)
%     [~, buttons, ~] = read(joy);
%     keyPressed = get(gcf, 'CurrentKey'); % Get the current key pressed on the figure
% 
%     % Define the keyboard key you want to use to stop the simulation (e.g., 'escape')
%     stop_key = 'k';
% 
% 
%     if buttons(stop_button) == 1 || strcmp(keyPressed, stop_key)
%         fprintf('Stop button pressed. Exiting the simulation.\n');
%         clear joy;
%         error('Simulation Stopped by User'); % Raise an error to stop the code.
%     end
% end




