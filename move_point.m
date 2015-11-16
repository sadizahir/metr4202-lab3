function inv = move_point(x,y,z)
global mA;
global mB;
global mC;
global PRESENT_POSITION;
global ANGLE_UNIT;
global ANGLE_UNIT_MX;
global mA_offset;
global mB_offset;
global mC_offset;


inv1 = invkine1(x,y,z);
% inv2 = invkine2(x,y,z);
% inv3 = invkine3(x,y,z);
% inv4 = invkine4(x,y,z);

inv1_valid = 0;
% inv2_valid = 0;
% inv3_valid = 0;
% inv4_valid = 0;


%motor a can operate between 0 and 360 with a reset at 0 and 360
%mB   44-271  - zero at 148
%mC   28-300  - zero at 148??

%check if within operating range
if (isreal(inv1(1)) && isreal(inv1(2)) && isreal(inv1(3)) && (inv1(2)+ mB_offset > 44) && (inv1(2)+mB_offset < 271) && (inv1(3)+mC_offset > 28) && (inv1(3)+mC_offset < 300))
    inv1_valid = 1;
end
% if (isreal(inv2(1)) && isreal(inv2(2)) && isreal(inv2(3)) && (inv2(2)+ mB_offset > 44) && (inv2(2)+mB_offset < 271) && (inv2(3)+mC_offset > 28) && (inv2(3)+mC_offset < 300))
%     inv2_valid = 1;
% end
% if (isreal(inv3(1)) && isreal(inv3(2)) && isreal(inv3(3)) && (inv3(2)+ mB_offset > 44) && (inv3(2)+mB_offset < 271) && (inv3(3)+mC_offset > 28) && (inv3(3)+mC_offset < 300))
%     inv3_valid = 1;
% end
% if (isreal(inv4(1)) && isreal(inv4(2)) && isreal(inv4(3)) && (inv4(2)+ mB_offset > 44) && (inv4(2)+mB_offset < 271) && (inv4(3)+mC_offset > 28) && (inv4(3)+mC_offset < 300))
%     inv4_valid = 1;
% end



if(inv1_valid)% || inv2_valid || inv3_valid || inv4_valid)
%     display('There is a real solution')
else
    error('No real solution exists for %d, %d, %d', x,y,z)
end




%GET THE CURRENT LOCATION OF THE MOTORS
% t1 = read_info(mA, PRESENT_POSITION, 2)*ANGLE_UNIT_MX-mA_offset;
% t2 = read_info(mB, PRESENT_POSITION, 2)*ANGLE_UNIT-mB_offset;
% t3 = read_info(mC, PRESENT_POSITION, 2)*ANGLE_UNIT-mC_offset;

%find the kinematics closest to the current location
%INV1 AND INV2 HAVE THE THE SAME T1. INV3 AND INV4 HAVE THE SAME T1.

% if (t1 - inv1(1) < t1-inv3(1)) %INV 1 or 3 CLOSER TO T1
%     if (t2 - inv1(2) < t2 - inv3(2))
%         display('1 is closest')
%         inv = inv1;
%         iv = 1;
%     else 
%         display('3 is closest')
%         inv = inv3;
%         iv = 3;
%     end
% else
%     if (t2 - inv2(2) < t2 - inv4(2))
%         display('2 is closest')
%         inv = inv2;
%         iv = 2;
%     else
%         display('4 is closest')
%         inv = inv4;
%         iv = 4;
%     end
% end

% if ((t1-angles(1,1)) < (t1-angles(2,1))) %INV 1 & 3 CLOSER TO T1
%     if ((t2-angles(1,2)) < (t2-angles(3,2))) % INV 1 CLOSER TO T2
% %         display('1 is closest')
%         inv = angles(1,:);
%     else
% %         display('3 is closest')
%         inv = angles(3,:);
%     end
% else
%     if ((t2-angles(2,2)) < (t2-angles(4,2))) % INV 2 CLOSER TO T2
% %         display('2 is closest')
%         inv = angles(2,:);
%     else
% %         display('4 is closest')
%         inv = angles(4,:);
%     end
% end



% angles = find_angles(x,y,z)
% motor_angles_packet(inv(1), inv(2), inv(3))
inv1
motor_angles_packet(inv1(1), inv1(2), inv1(3))