function points = convert(points_mm)
global BOARD_HEIGHT;
global BOARD_WIDTH;
global BOARD_LENGTH;
points = zeros(6, 3);
for i = 1:6
    points(i,1) = points_mm(i, 1)/10 - BOARD_LENGTH;
    points(i,2) = points_mm(i, 1)/10 - BOARD_WIDTH;
    points(i,3) = BOARD_HEIGHT;
    
end