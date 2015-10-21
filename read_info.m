%READ INFORMATION FROM AN ADDRESS FROM A GIVEN MOTOR.
%POSSIBLE ADDR
%PRESENT_POSITION,  2 bytes
%PRESENT_SPEED, 2 bytes
%MOVING. 1 byte
%LENGTH CAN BE 1 OR 2 BYTES
%mID IS THE ID OF THE MOTOR TO BE READ - mA, mB, mC. CANNOT BE BROADCAST
%ID.

function [data] = read_info(mID, ADDR, length)
if length == 2
        data = calllib('dynamixel','dxl_read_word', mID, ADDR);
elseif length == 1
        data = calllib('dynamixel','dxl_read_byte', mID, ADDR);
end
    
