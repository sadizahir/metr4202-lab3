function motor_angles_packet(t1, t2, t3)

global mA;
global mB;
global mC;
global ANGLE_UNIT;
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



current_A = 




%COVERT FROM KINEMATIC ANGLE TO DYNAMIXEL ANGLE
t1_o = t1 + mA_offset;
t2_o = t2 + mB_offset;
t3_o = t3 + mC_offset;


angle_A = t1_o;
angle_B = t2_o;
angle_C = t3_o;



%FIND THE MAXIMUM ANGLES IN DEGREES
mA_max_d = mA_max*ANGLE_UNIT;
mB_max_d = mB_max*ANGLE_UNIT;
mC_max_d = mC_max*ANGLE_UNIT;

mA_min_d = mA_min*ANGLE_UNIT;
mB_min_d = mB_min*ANGLE_UNIT;
mC_min_d = mC_min*ANGLE_UNIT;

%CALCULATE THE DESIRED POSITION OF THE MOTORS
% desired_A = round((t1+mA_offset)/ANGLE_UNIT);
% desired_B = round((t2+mB_offset)/ANGLE_UNIT);
% desired_C = round((t3+mC_offset)/ANGLE_UNIT);

% if (ARM_MOVE)
%     angle_A = t1+mA_offset+180
%     angle_B = -(t2+mB_offset)
%     angle_C = -(t3+mC_offset)
% %     angle_A = round((180+t1+mA_offset)/ANGLE_UNIT);
% %     angle_B = round((-t2+mB_offset)/ANGLE_UNIT);
% %     angle_C = round((-t3+mC_offset)/ANGLE_UNIT);
% else
%     angle_A = t1+mA_offset
%     angle_B = t2+mB_offset
%     angle_C = t3+mC_offset
% end
    



% if (t1_o < 0)
%     display('mA < 0'); 
%     angle_A = 360 + t1;
% elseif (t1_o > 360)
%      display('mA > 360'); 
%     angle_A = t1 - 360;
% end


%Fix a
if (t1_o >= mA_max_d && t1_o <= 360) %ANGLE IS IN GREY AREA
    display('max < mA < 360'); 
    angle_A = t1 - 180 + mA_offset;
    angle_B = -t2 + mA_offset;
    angle_C = -t3 + mA_offset;
    
elseif (t1_o <= mA_min_d && t1_o >= 0) %ANGLE IS IN GREY AREA
    display('0 < mA < min'); 
    angle_A = t1 + 180 + mA_offset;
    angle_B = -t2 + mA_offset;
    angle_C = -t3 + mA_offset;
% elseif (angle_A < 0)
%     display('mA < 0'); 
%     angle_A = 360 + angle_A
end


if (angle_A < 0)
    display('mA < 0'); 
    angle_A = 360 + angle_A;
elseif (t1_o > 360)
     display('mA > 360'); 
    angle_A = angle_A - 360;
end


pos_A = round((angle_A)/ANGLE_UNIT);
pos_B = round((angle_B)/ANGLE_UNIT);
pos_C = round((angle_C)/ANGLE_UNIT);


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
% while (read_info(mA, MOVING, 1) || read_info(mB, MOVING, 1) || read_info(mC, MOVING, 1))
% end


