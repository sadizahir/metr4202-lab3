function find_path(p1, p2)
global mA;
global mB;
global mC;
global MOVING;
global PRESENT_POSITION;
global ANGLE_UNIT;
global ANGLE_UNIT_MX;
global mA_offset;
global mB_offset;
global mC_offset;


% fprintf('\nfinding path between [%f,%f,%f] and [%f,%f,%f]\n', p1(1), p1(2), p1(3), p2(1), p2(2), p2(3));
%find 3D distance between two paths (in cm)
% dist = ((p1(1)-p2(1))^2 + (p1(2)-p2(2))^2 + (p1(3)-p2(3))^2)^(0.5);

%Number of path points equal to 5mm increments 
num_points = 10;%round(dist/0.5);

%ONLY MOVES TO N POINTS 
x = linspace(p1(1), p2(1), num_points);
y = linspace(p1(2), p2(2), num_points);
z = linspace(p1(3), p2(3), num_points);

t1 = read_info(mA, PRESENT_POSITION, 2)*ANGLE_UNIT_MX-mA_offset;
t2 = read_info(mB, PRESENT_POSITION, 2)*ANGLE_UNIT-mB_offset;
t3 = read_info(mC, PRESENT_POSITION, 2)*ANGLE_UNIT-mC_offset;

an = invkine(x(1),y(1),z(1));
co = f_kine(t1,t2,t3);
% fprintf('[%f, %f, %f] -> [%f, %f, %f] -> [%f, %f, %f] -> [%f, %f, %f]\n', x(1),y(1),z(1), an(1), an(2), an(3), co(1), co(2), co(3), t1, t2, t3);

% path = zeros(num_points, 3);

%MOVE TO THE FIRST CO-ORDINATE AND WAIT FOR THE MOTORS TO STOP
% move_point(x(1), y(1), z(1));

% angles = find_angles(x(1), y(1), z(1));
% motor_angles_packet(angles(1), angles(2), angles(3));
while (read_info(mA, MOVING, 1) || read_info(mB, MOVING, 1) || read_info(mC, MOVING, 1))
end

for i = 2:num_points
    t1 = read_info(mA, PRESENT_POSITION, 2)*ANGLE_UNIT_MX-mA_offset;
    t2 = read_info(mB, PRESENT_POSITION, 2)*ANGLE_UNIT-mB_offset;
    t3 = read_info(mC, PRESENT_POSITION, 2)*ANGLE_UNIT-mC_offset;

    an = invkine(x(i),y(i),z(i));
    co = f_kine(t1,t2,t3);
%     fprintf('[%f, %f, %f] -> [%f, %f, %f] -> [%f, %f, %f] -> [%f, %f, %f]\n', x(i),y(i),z(i), an(1), an(2), an(3), co(1), co(2), co(3), t1, t2, t3);

    
    
    move_point(x(i), y(i), z(i));

%     angles = find_angles(x(i), y(i), z(i));
%     motor_angles_packet(angles(1), angles(2), angles(3));
%     path(i, 1) = x(i);
%     path(i, 2) = y(i);
%     path(i, 3) = z(i);
end
