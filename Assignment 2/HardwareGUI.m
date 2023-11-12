function HardwareGUI
   % Connect to Arduino
a = arduino('COM3', 'Uno'); % Specify the port and model

% Define pin number for pushbutton
buttonPin = 'D9'; % Pushbutton connected to digital pin 9

% Setup pin mode
configurePin(a, buttonPin, 'DigitalInput');  % Set button pin as input

% Function to call when the button is released
function continueExecution()
    disp('Button released, continuing with other functions...');
    % Here you can call other functions or add code that needs to be executed
    % after the button is released
end

% Main loop
while true
    buttonState = readDigitalPin(a, buttonPin);
    
    % Check if the pushbutton is pressed
    if buttonState == 0
        disp('Button pressed, pausing...');
        % Wait here (pause the loop) until the button is released
        while readDigitalPin(a, buttonPin) == 0
            pause(0.01); % Short pause to prevent busy waiting
        end
        
        % Button has been released, continue execution
        continueExecution();
    end
    
    % Add a delay to prevent the loop from running too fast
    pause(0.1);
end

end

