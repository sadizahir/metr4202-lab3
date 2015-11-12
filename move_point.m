function move_point(x,y,z)
angles = find_angles(x,y,z)
motor_angles_packet(angles(1), angles(2), angles(3))