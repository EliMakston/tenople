DisconnectBrick(brick);
brick = ConnectBrick("TENOPLE");
brick.beep();
brick.SetColorMode(2,2);

global key;
InitKeyboard();

while 1
    distance = brick.UltrasonicDist(1);
    color = brick.ColorCode(2);
    touch = brick.TouchPressed(3);
    touched = false;
    brick.MoveMotor('A', -27);
    brick.MoveMotor('B', -25);
    if touch
        brick.MoveMotor('AB', 0);
        if distance < 20
            brick.MoveMotor('AB', 25);
            pause(2);
            brick.MoveMotor('AB', 0);
            brick.MoveMotorAngleRel('A', 25, -380, "Brake");
            pause(2);
        elseif distance > 20
            brick.MoveMotor('AB', 25);
            pause(2);
            brick.MoveMotor('AB', 0);
            brick.MoveMotorAngleRel('B', 25, -380, "Brake");
            pause(2);
            touched = true;
        end
    end
    if ((distance > 100) && (distance < 160)) && touched
        brick.MoveMotor('AB', 25);
        pause(2);
        brick.MoveMotor('AB', 0);
        brick.MoveMotorAngleRel('B', 25, -380, "Brake");
        pause(2);
    end     
    if color == 5
        brick.MoveMotor('AB', 0);
        pause(1);
        brick.MoveMotor('A', -27);
        brick.MoveMotor('B', -25);
        pause(0.7);
    end
    if color == 2
        break;
    end
end
disp('Keyboard mode');
while 1
    pause(0.3);
    switch key
        case 'w'
            brick.MoveMotor('AB', -100);
            disp("Up arrow pressed");
            
            if distance < 10
                brick.MoveMotor('AB', 0);
            end
        case 'e'
            brick.MoveMotor('C', 50);
            pause(0.5);
            brick.MoveMotor('C', 0);
        case 's'
            disp("Down arrow pressed");
            brick.MoveMotor('AB', 100);
        case 'a'
            brick.MoveMotor('A', -100);
            brick.MoveMotor('B', 75);
            disp("Left arrow pressed");
        case 'd'
            brick.MoveMotor('B', -100);
            brick.MoveMotor('A', 75);
            disp("Right arrow pressed");
        case 'q'
            brick.beep();
            brick.MoveMotor('AB', 0);
            disp("Exiting keyboard mode");
            break;
        case 0
            % disp("No key press");
            brick.MoveMotor('AB', 0);
    end
end

while 1
    pause(0.001)
    distance = brick.UltrasonicDist(1);
    color = brick.ColorCode(2);
    touch = brick.TouchPressed(3);
    brick.MoveMotor('A', -27);
    brick.MoveMotor('B', -25);
    if touch
        brick.MoveMotor('AB', 0);
        brick.MoveMotor('AB', 25);
        pause(2);
        brick.MoveMotor('AB', 0);
        brick.MoveMotorAngleRel('A', 25, -380, "Brake");
        pause(2);
    end
    if color == 5
        brick.MoveMotor('AB', 0);
        pause(1);
        brick.MoveMotor('A', -27);
        brick.MoveMotor('B', -25);
        pause(0.7);
    end
    if color == 4
        brick.MoveMotor('AB', 0);
        break;
    end
end