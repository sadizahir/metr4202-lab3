function bandaid(x,y,o)
global BOARD_HEIGHT
clf('reset')
hold on
axis square
z = BOARD_HEIGHT - 1.5;
bl = 4; %bandaid length in cm
if (o == 1)
    p1 = [x,y,z];
    p2 = [x+bl/2, y, z];
    p3 = [x-bl/2, y, z];
else 
    p1 = [x,y,z];
    p2 = [x, y+bl/2, z];
    p3 = [x, y-bl/2, z];
end



find_path(p1,p2)
find_path(p2,p3)
plot3([p1(2), p2(2)],[p1(1), p2(1)],[z,z], '-x')
pause(0.5)
plot3([p2(2), p3(2)],[p2(1), p3(1)],[z,z], '-x')


end