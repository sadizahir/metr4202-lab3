function change_arm_orientation(x, y, z)
%CHANGES THE ORIENTATION OF THE ARM WITHOUT CAUSING DISRUPTION 
global mC;
angles = invkine(x,y,z)
motor_angles_packet(angles(1), angles(2), angles(3))

% angles1 = invkine(x,y,z-5)
% pause(3);
% motor_angles(mA, angles1(
% motor_angles_packet(angles1(1), angles1(2), angles1(3))

ARM_MOVE = 1;
pause(3);
if (angles(2) > 0)
    motor_angles(mC, 90)


if (angles(3) > 0)
    a = 90;
    motor_angles(mC, 90)
else 
    a = -90;
    motor_angles(mC, -90)
end
pause(3);

motor_angles(mA, angles(1)+180);
motor_angles(mB, -angles(2));
motor_angles(mC, -angles(3));
