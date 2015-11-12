function find_path(p1, p2)
num_points = 10;

%ONLY MOVES TO 10 POINTS - PROB FOR LARGER DISTANCES AND SMALLER.
x = linspace(p1(1), p2(1), num_points);
y = linspace(p1(2), p2(2), num_points);
z = linspace(p1(3), p2(3), num_points);

% path = zeros(num_points, 3);

for i = 1:num_points
    
    angles = invkine(x(i), y(i), z(i))
    motor_angles_packet(angles(1), angles(2), angles(3))
%     path(i, 1) = x(i);
%     path(i, 2) = y(i);
%     path(i, 3) = z(i);
end
