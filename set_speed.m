function set_speed(rpm)
global BROADCAST_ID;
global MOVING_SPEED;

speed = rpm/0.111;
calllib('dynamixel', 'dxl_write_word', BROADCAST_ID, MOVING_SPEED, speed);
