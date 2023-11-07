brick = ConnectBrick("TENOPLE");
brick.beep();
global key
InitKeyboard();
while 1
    pause(0.1);
    distance = brick.UltrasonicDist(1);
    %brick.SetColorMode(2, 2);
    %color = brick.ColorCode(2);
    %disp(color);
    switch key
        case 'w'
        brick.MoveMotor('AB', -100);
        disp("Up arrow pressed");
        %if distance < 10
         %   brick.MoveMotor('AB', 0);
        %end
    case 's'
        disp("Down arrow pressed");
        brick.MoveMotor('AB', 100);
    case 'a'
        brick.MoveMotor('A', -25);
        brick.MoveMotor('B', 25);
        disp("Left arrow pressed");
    case 'd'
        brick.MoveMotor('B', -25);
        brick.MoveMotor('A', 25);
        disp("Right arrow pressed");
    case 'm'
        brick.MoveMotor('C', -1);
    case 'n'
        brick.MoveMotor('C', 1);
    case 'q'
        brick.beep();
        break;
    case 0
        % disp("No key press");
        brick.MoveMotor('AB', 0);
    end
end
