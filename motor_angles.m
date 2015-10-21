%MOVES THE MOTORS TO THE GIVEN ANGLES. ARGS ARE IN DEGREES
function motor_angles(t1, t2, t3)
global mA;
global mB;
global mC;
global ANGLEUNIT;
global MOVING;
global GOAL_POSITION;
global PRESENT_POSITION;

%CALCULATE THE DESIRED POSITION OF THE MOTORS
desired_A = round(t1/ANGLEUNIT);
desired_B = round(t2/ANGLEUNIT);
desired_C = round(t3/ANGLEUNIT);

%SEND THE POSITION TO THE MOTORS
calllib('dynamixel', 'dxl_write_word', mA, GOAL_POSITION, desired_A);
calllib('dynamixel', 'dxl_write_word', mB, GOAL_POSITION, desired_B);
calllib('dynamixel', 'dxl_write_word', mC, GOAL_POSITION, desired_C);


%WAITS FOR THE MOTORS TO STOP MOVING
while (read_info(mA, MOVING, 1) || read_info(mB, MOVING, 1) || read_info(mC, MOVING, 1))
end

%FINDS THE ERROR BETWEEN THE DESIRED POSITION AND THE ACTUAL POSITION
errorA = read_info(mA, PRESENT_POSITION, 2) - desired_A;
errorB = read_info(mB, PRESENT_POSITION, 2) - desired_B;
errorC = read_info(mC, PRESENT_POSITION, 2) - desired_C;



% CORRECT FOR ANY ERROR
% ERR = 2
% if (abs(errorA) > ERR) 
%     calllib('dynamixel', 'dxl_write_word', mA, GOAL_POSITION, desired_A + errorA);
% elseif (abs(errorB) > ERR)
%      calllib('dynamixel', 'dxl_write_word', mA, GOAL_POSITION, desired_B + errorB);
% elseif (abs(errorC) > ERR)
%      calllib('dynamixel', 'dxl_write_word', mA, GOAL_POSITION, desired_C + errorC);
% end




    