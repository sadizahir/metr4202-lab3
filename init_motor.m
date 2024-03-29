%INITIALISES THE DYNAMIXELS AND GLOBAL VARIABLES.

%MAKE SURE THE CLEAN_UP FUNCTION IS CALLED AT SOMEPOINT AFTERWARDS 

clear;
global ANGLE_UNIT;
global ANGLE_UNIT_MX;
global ARM_MOVE; 
global BROADCAST_ID;
global INST_SYNC_WRITE;
global GOAL_POSITION;
global MOVING_SPEED;
global PRESENT_POSITION;
global PRESENT_SPEED;
global MOVING;
global NUM_ACTUATORS;
global INIT_POS;
global INIT_ANGLE;
global L1;
global L2;
global L3;
global HEIGHT;
global mA;
global mB;
global mC;
global mA_max;
global mA_min;
global mA_offset;
global mB_max;
global mB_min;
global mB_offset;
global mC_max;
global mC_min;
global mC_offset;
global BOARD_HEIGHT;
global BOARD_WIDTH;
global BOARD_LENGTH;
global INV_KINE;

%DIMENSIONS OF BOARD
BOARD_HEIGHT = 46; %DISTANCE TO BOARD FROM KINEMATIC 0
BOARD_WIDTH = 15; %IN Y DIRECTION
BOARD_LENGTH = 20; %IN X DIRECTION

% If ARM_MOVE IS SET TO 0 THE OPERATES IN ITS NORMAL POSITION WITH 
% mB AND mA > 0. IF THE ARM TRIES TO MOVE INTO A POSITION IN THE 'GREY ZONE'
% ARM_MOVE BECOMES 1 AND THE ARM MOVES WITH 
ARM_MOVE = 0;

% ALLOWED MOVEMENT OF ARM. AND OFFSET BETWEEN MOTOR AND KINEMATIC ZERO.
mA_max = 4095;  %360.36  -> 229.36
mA_min = 0;     %0      -> -131
mA_offset = 131; 

mB_max = 925;    %271 -> - 120
mB_min = 150;    %43.95 -> -107.1
mB_offset = 151;

mC_max = 1024;   %300 -> 150
mC_min = 95;    %27.8 -> -122
mC_offset = 150;


%THE NUMBER OF ACTUATORS IN USE
NUM_ACTUATORS = 3;

%Set the id's for each motor
mA = 1;
mB = 2;
mC = 3;


%Link Lengths
L1 = 3;
L2 = 17.7;
L3 = 29;

%hEIGHT OF FIRST MOTOR
HEIGHT = 50; 

%DYNAMIXEL CONSTANTS
BROADCAST_ID = 254;         %SENDS THE DATA TO ALL OF THE CONNECTED MOTORS.
INST_SYNC_WRITE = 131;
ANGLE_UNIT = 0.293;         
ANGLE_UNIT_MX = 0.088;


%AX-12A ADDRESSES
GOAL_POSITION = 30;         %2BYTES. BETWEEN 0-1023 (JOIN MODE). 1 UNIT IS 0.293 DEGREES
MOVING_SPEED = 32;          %2 BYTES. BETWEEN 0-1023 (JOIN MODE). 1 UNIT IS APPROX 0.111 RPM.
PRESENT_POSITION = 36;      %2 BYTES. CONTAINS THE ADDRESS OF THE CURRENT POSTION OF THE MOTOR.
PRESENT_SPEED = 38;         %2 BYTES. CONTAINS THE CURRENT SPEED OF THE MOTOR.
MOVING = 46;                % ONE BYTE. RETURNS 1 IF STILL MOVING. 0 IF STATIONARY.

%LOAD THE LIBRARY
loadlibrary('dynamixel', 'dynamixel.h');

%INITAILSE THE DYNAMIXELS ON COM3 AT 1MBPS
res = calllib('dynamixel', 'dxl_initialize', 3, 1);

%Check if the connection is connected
if res == 0
   display('Cant find dynamixel')
   display('Is the Dynamixel Wizard disconnected?')
   display('Call clean_up before trying again')
else
    %SET the speed of the motors
    INIT_SPEED = 83;
    calllib('dynamixel', 'dxl_write_word', mA, MOVING_SPEED, 55);
    calllib('dynamixel', 'dxl_write_word', mB, MOVING_SPEED, INIT_SPEED);
    calllib('dynamixel', 'dxl_write_word', mC, MOVING_SPEED, INIT_SPEED);

    %Set the position of all of the motors
    move_point(0,0,BOARD_HEIGHT)
    INV_KINE = 1;
    %motor_angles_packet(angles(1),angles(2),angles(3))
end
