function move_up()
global mA
global mB
global mC
global PRESENT_POSITION
global ANGLE_UNIT_MX
global ANGLE_UNIT
global BROADCAST_ID;
global INST_SYNC_WRITE;
global GOAL_POSITION;
global MOVING;
global mA_max;
global mA_min;
global mA_offset;
global mB_max;
global mB_min;
global mB_offset;
global mC_max;
global mC_min;
global mC_offset;

% 
% mA_max_d = mA_max*ANGLE_UNIT_MX
% mB_max_d = mB_max*ANGLE_UNIT
% mC_max_d = mC_max*ANGLE_UNIT
% 
% mA_min_d = mA_min*ANGLE_UNIT_MX
% mB_min_d = mB_min*ANGLE_UNIT
% mC_min_d = mC_min*ANGLE_UNIT

%GET THE CURRENT LOCATION OF THE MOTORS
t1 = read_info(mA, PRESENT_POSITION, 2)*ANGLE_UNIT_MX-mA_offset
t2 = read_info(mB, PRESENT_POSITION, 2)*ANGLE_UNIT-mB_offset
t3 = read_info(mC, PRESENT_POSITION, 2)*ANGLE_UNIT-mC_offset

coords = f_kine(t1,t2,t3)
% move_point(coords(1), coords(2), coords(3)-3);
iv = invkine1(coords(1), coords(2), coords(3)-3)
% f_kine(iv(1), iv(2), iv(3))



a1 = iv(1) + mA_offset;
a2 = iv(2) + mB_offset;
a3 = iv(3) + mC_offset;

if (a1 < 0)
%     display('mA < 0'); 
    a1 = 360 + a1;
elseif (a1 > 360)
%      display('mA > 360'); 
    a1 = a1 - 360;
end


pos_A = round(a1/ANGLE_UNIT_MX);
pos_B = round(a2/ANGLE_UNIT);
pos_C = round(a3/ANGLE_UNIT);

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

%WAITS FOR THE MOTORS TO STOP MOVING
while (read_info(mA, MOVING, 1) || read_info(mB, MOVING, 1) || read_info(mC, MOVING, 1))
end