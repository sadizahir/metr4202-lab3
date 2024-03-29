function motor_angles_packet(t1, t2, t3)

global mA;
global mB;
global mC;
global ANGLE_UNIT;
global ANGLE_UNIT_MX;
global MOVING;
global GOAL_POSITION;
global PRESENT_POSITION;
global BROADCAST_ID;
global INST_SYNC_WRITE;
global NUM_ACTUATORS;
global mA_max;
global mA_min;
global mA_offset;
global mB_max;
global mB_min;
global mB_offset;
global mC_max;
global mC_min;
global mC_offset;
global ARM_MOVE; 




%COVERT FROM KINEMATIC ANGLE TO DYNAMIXEL ANGLE
t1_o = t1 + mA_offset;
t2_o = t2 + mB_offset;
t3_o = t3 + mC_offset;


% angle_A = t1_o;
% angle_B = t2_o;
% angle_C = t3_o;
t1_c = read_info(mA, PRESENT_POSITION, 2)*ANGLE_UNIT_MX;%+mA_offset
t2_c = read_info(mB, PRESENT_POSITION, 2)*ANGLE_UNIT;%+mA_offset
t3_c = read_info(mC, PRESENT_POSITION, 2)*ANGLE_UNIT;%+mA_offset





if (t1_o < 0)
%     display('mA < 0'); 
    t1_o = 360 + t1_o;
%     t1_ck = t1_ck - 360 
elseif (t1_o > 360)
%      display('mA > 360'); 
    t1_o = t1_o - 360;
%     t1_ck = t1_ck + 360 
%     t1_c = t1_c - 360
end


pos_A = round((t1_o)/ANGLE_UNIT_MX);
pos_B = round((t2_o)/ANGLE_UNIT);
pos_C = round((t3_o)/ANGLE_UNIT);

angle1_diff = t1_o - t1_c;
angle2_diff = t2_o - t2_c;
angle3_diff = t3_o - t3_c;

if (angle1_diff > 45 || angle1_diff < -45)
    fprintf('angle1: %f to %f. diff: %f\n', t1_o, t1_c, angle1_diff);
    move_up()
    calllib('dynamixel', 'dxl_write_word', mA, GOAL_POSITION, pos_A);
    pause(0.5)
elseif (angle2_diff > 45 || angle2_diff < -45)
    fprintf('angle2: %f to %f. diff: %f\n', t2_o, t2_c, angle2_diff);
    move_up()
    calllib('dynamixel', 'dxl_write_word', mC, GOAL_POSITION, pos_C-5);
    pause(0.5) 
elseif (angle3_diff > 45 || angle3_diff < -45)
    fprintf('angle3: %f to %f. diff: %f\n', t3_o, t3_c, angle3_diff);
    move_up()
    calllib('dynamixel', 'dxl_write_word', mC, GOAL_POSITION, pos_C);
    pause(0.5)
end

 % Make syncwrite packet
calllib('dynamixel','dxl_set_txpacket_id',BROADCAST_ID);
calllib('dynamixel','dxl_set_txpacket_instruction',INST_SYNC_WRITE);
calllib('dynamixel','dxl_set_txpacket_parameter',0,GOAL_POSITION);
calllib('dynamixel','dxl_set_txpacket_parameter',1,2);

i = 0;

%SEND THE POSITION TO THE MOTORS IF THE ANGLE IS VALID
if(pos_A < mA_max && pos_A > mA_min)
 calllib('dynamixel','dxl_set_txpacket_parameter',2+3*i,mA);
    low = calllib('dynamixel','dxl_get_lowbyte', pos_A);
    calllib('dynamixel','dxl_set_txpacket_parameter',2+3*i+1,low);
    high = calllib('dynamixel','dxl_get_highbyte',pos_A);
    calllib('dynamixel','dxl_set_txpacket_parameter',2+3*i+2,high);
    i = i+1;
else
    display('out of range for mA');
end

if(pos_B < mB_max && pos_B > mB_min)
 calllib('dynamixel','dxl_set_txpacket_parameter',2+3*i,mB);
    low = calllib('dynamixel','dxl_get_lowbyte', pos_B);
    calllib('dynamixel','dxl_set_txpacket_parameter',2+3*i+1,low);
    high = calllib('dynamixel','dxl_get_highbyte',pos_B);
    calllib('dynamixel','dxl_set_txpacket_parameter',2+3*i+2,high);
    i = i+1;
else
    display('out of range for mB');
end

if(pos_C < mC_max && pos_C > mC_min)
 calllib('dynamixel','dxl_set_txpacket_parameter',2+3*i,mC);
    low = calllib('dynamixel','dxl_get_lowbyte', pos_C);
    calllib('dynamixel','dxl_set_txpacket_parameter',2+3*i+1,low);
    high = calllib('dynamixel','dxl_get_highbyte',pos_C);
    calllib('dynamixel','dxl_set_txpacket_parameter',2+3*i+2,high);
    i = i+1;
else
    display('out of range for mC');
end
calllib('dynamixel','dxl_set_txpacket_length',(2+1)*i+4); %IS THIS CORRECT??
calllib('dynamixel','dxl_txrx_packet')

pause(0.5);

%WAITS FOR THE MOTORS TO STOP MOVING
while (read_info(mA, MOVING, 1) || read_info(mB, MOVING, 1) || read_info(mC, MOVING, 1))
end


    

