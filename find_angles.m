function inv = find_angles(x,y,z)
global L1;
global L2;
global L3;
global mA;
global mB;
global mC;
global PRESENT_POSITION;
global ANGLE_UNIT;
global mA_offset;
global mB_offset;
global mC_offset;

inv = zeros(1,3);

angles = zeros(4,3);
%FIRST 2 AND LAST 2 SOLUTIONS HAVE SAME ANGLE
t1 = read_info(mA, PRESENT_POSITION, 2)*ANGLE_UNIT-mA_offset;
t2 = read_info(mB, PRESENT_POSITION, 2)*ANGLE_UNIT-mB_offset;
t3 = read_info(mC, PRESENT_POSITION, 2)*ANGLE_UNIT-mC_offset;

d = sqrt(x^2 + y^2);
f = sqrt(d^2 + (z-L1)^2);

g = asind(d/f);


if(x == 0 && y == 0)
else 
    angles(1,1) = atand(y/x)+90;
    angles(2,1) = atand(y/x)+90;
    if (angles(1,1) <= 180)
        angles(3,1) = atand(y/x)+90+180;  
        angles(4,1) = atand(y/x)+90+180;
    else 
        angles(3,1) = atand(y/x)+90-180;  
        angles(4,1) = atand(y/x)+90-180;
    end
    if(x < 0)
        angles(1,1) = angles(1,1)-180;
        angles(2,1) = angles(2,1)-180;
        angles(3,1) = angles(3,1)-180;
        angles(4,1) = angles(4,1)-180;
    end
end

a = acosd((L3^2 - L2^2 - f^2)/(-2*L2*f));
b = 180 - acosd((f^2 - L2^2 - L3^2)/(-2*L2*L3));

angles(1,2) = g-a;
angles(2,2) = g+a;
angles(3,2) = a-g;
angles(4,2) = -g-a;


angles(1,3) = b;
angles(2,3) = -b;
angles(3,3) = -b;
angles(4,3) = b;

f_kine(angles(1,1), angles(1,2), angles(1,3));
f_kine(angles(2,1), angles(2,2), angles(2,3));
f_kine(angles(3,1), angles(3,2), angles(3,3));
f_kine(angles(4,1), angles(4,2), angles(4,3));


t1 = read_info(mA, PRESENT_POSITION, 2)*ANGLE_UNIT;
t2 = read_info(mB, PRESENT_POSITION, 2)*ANGLE_UNIT;
t3 = read_info(mC, PRESENT_POSITION, 2)*ANGLE_UNIT;


%==??
if ((t1-angles(1,1)) < (t1-angles(2,1))) %INV 1 & 3 CLOSER TO T1
    if ((t2-angles(1,2)) < (t2-angles(3,2))) % INV 1 CLOSER TO T2
%         display('1 is closest')
        inv = angles(1,:);
        
    else
%         display('3 is closest')
        inv = angles(3,:);
    end
else
    if ((t2-angles(2,2)) < (t2-angles(4,2))) % INV 2 CLOSER TO T2
%         display('2 is closest')
        inv = angles(2,:);
    else
%         display('4 is closest')
        inv = angles(4,:);
    end
end





% if(x == 0 && y == 0)
%     if (-14 <= t1 && t1 <= 180) %%LEFT SIDE OF MOTOR
%         display('Left side of motor')
%         if (t1 <= 45)
%             display('Closest to 0')
%             inv(1) = 0;
%         elseif (45 < t1 && t1 <= 135)
%                         display('Closest to 90')
%             inv(1) = 90;
%         else
%                         display('Closest to 180')
% 
%             inv(1) = 180;
%         end
%     elseif (180 < t1 && t1 <= 286) %% RIGHT SIDE OF MOTOR
%         display('Right side of motor')
%         if (t1 >= -135)
%                         display('Closest to -90')
% 
%             inv(1) = -90;
%         else 
%                         display('Closest to -180')
%             inv(1) = -180;
%         end
%     else
%          display('out of range??')
%     end
% end





angles;
current_angles = [t1, t2, t3];








