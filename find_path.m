function find_path(p1, p2)
global mA;
global mB;
global mC;
global MOVING;


%find 3D distance between two paths (in cm)
dist = ((p1(1)-p2(1))^2 + (p1(2)-p2(2))^2 + (p1(3)-p2(3))^2)^(0.5);

%Number of path points equal to 5mm increments 
num_points = round(dist/0.5);

%ONLY MOVES TO N POINTS 
x = linspace(p1(1), p2(1), num_points);
y = linspace(p1(2), p2(2), num_points);
z = linspace(p1(3), p2(3), num_points);

% path = zeros(num_points, 3);

%MOVE TO THE FIRST CO-ORDINATE AND WAIT FOR THE MOTORS TO STOP
    move_point(x(1), y(1), z(1));

% angles = find_angles(x(1), y(1), z(1));
% motor_angles_packet(angles(1), angles(2), angles(3));
while (read_info(mA, MOVING, 1) || read_info(mB, MOVING, 1) || read_info(mC, MOVING, 1))
end

for i = 2:num_points - 1
    move_point(x(i), y(i), z(i));
    x(i)
    y(i)
    z(i)
%     angles = find_angles(x(i), y(i), z(i));
%     motor_angles_packet(angles(1), angles(2), angles(3));
%     path(i, 1) = x(i);
%     path(i, 2) = y(i);
%     path(i, 3) = z(i);
end
