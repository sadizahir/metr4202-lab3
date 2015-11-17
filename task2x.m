points_mm = [];

for i = 1:size(points_mm, 1)
    set = points_mm(i, :);
    set(3) = BOARD_HEIGHT;
    fprintf('Moving to point %d %d', set(1), set(2));
    move_up;
    move_point(set(1), set(2), set(3));
end