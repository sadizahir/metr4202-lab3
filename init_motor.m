%INITIALISES THE DYNAMIXELS AND GLOBAL VARIABLES.

%MAKE SURE THE CLEAN_UP FUNCTION IS CALLED AT SOMEPOINT AFTERWARDS 

clear;
global ANGLE_UNIT;
global BROADCAST_ID;
global INST_SYNC_WRITE;
global GOAL_POSITION;
global MOVING_SPEED;
global PRESENT_POSITION;
global PRESENT_SPEED;
global MOVING;
global INIT_POS;
global INIT_ANGLE;
global L1;
global L2;
global L3;
global mA;
global mB;
global mC;

%Set the id's for each motor
mA = 1;
mB = 2;
mC = 3;


%Link Lengths
L1 = 10;
L2 = 10;
L3 = 10;

%DYNAMIXEL CONSTANTS
BROADCAST_ID = 254;         %SENDS THE DATA TO ALL OF THE CONNECTED MOTORS.
INST_SYNC_WRITE = 131;
ANGLE_UNIT = 0.293;         


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
   clean_up
else
    %SET the speed of the motors
    INIT_SPEED = 300;
    calllib('dynamixel', 'dxl_write_word', BROADCAST_ID, MOVING_SPEED, INIT_SPEED);
    
    %Set the position of all of the motors
    INIT_POS = 512;
    INIT_ANGLE = INIT_POS*ANGLE_UNIT;
    calllib('dynamixel', 'dxl_write_word', BROADCAST_ID, GOAL_POSITION, INIT_POS);
end
