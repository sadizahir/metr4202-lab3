function coords = task5(type)
global BOARD_HEIGHT
clf('reset')
hold on
axis square
if (strcmp('line', type))
   prompt = 'Line start point [x,y,z]: ';
   s = input(prompt);
   prompt = 'Line end point [x,y,z]: ';
   e = input(prompt);
   find_path(s, e);
   coords = [s;e];
   
elseif (strcmp('square', type))
    prompt = 'first corner of square [x,y,z]: ';
    c1 = input(prompt);
    prompt = 'second corner of square [x,y,z]: ';
    c2 = input(prompt);
    prompt = 'third corner of square [x,y,z]: ';
    c3 = input(prompt);
    prompt = 'fourth corner of square [x,y,z]: ';
    c4 = input(prompt);
    move_up();
    find_path(c1, c2);
    find_path(c2, c3);
    find_path(c3, c4);
    find_path(c4, c1);
    coords = [c1;c2;c3;c4];
%     move_up();
elseif (strcmp('circle', type))
    prompt = 'centre at [x,y]: ';
    s = input(prompt);
    prompt = 'radius: ';
    r = input(prompt);
    c = [s(1),s(2), BOARD_HEIGHT];
    find_path_circle(r,c,0,2*pi)
elseif(strcmp('happyface', type))
    prompt = 'start at [x,y,z]: ';
    s = input(prompt);
    prompt = 'height: ';
    height = input(prompt);
    prompt = 'width: ';
    width = input(prompt);
    a1 = width/2;
    b1 = height/2;
    c1 = [s(1)-b1,s(2)+a1, BOARD_HEIGHT];
    find_path_ellipse(b1,a1,c1,0,2*pi)
    a2 = width*(1/3);
    b2 = height*(1/3);
    c2 = [s(1)-b1,s(2)+a1, BOARD_HEIGHT];
    find_path_ellipse(b2,a2,c2,pi/2,pi)
    r = width/8;
    c3 = [s(1)-height*(1/3), s(2)+width*(1/3),BOARD_HEIGHT]
    find_path_circle(r,c3,0,2*pi)
    c4 = [s(1)-height*(1/3), s(2)+width*(2/3),BOARD_HEIGHT]
    find_path_circle(r,c4,0,2*pi)
elseif(strcmp('star', type))
    
    prompt = 'start at [x,y,z]: ';
    s = input(prompt);
    prompt = 'height: ';
    height = input(prompt);
    prompt = 'width: ';
    width = input(prompt);
    p1 = [s(1), s(2)+width/2, BOARD_HEIGHT];
    p2 = [s(1)-height, s(2)+width, BOARD_HEIGHT];
    p3 = [s(1)-height*(1/4), s(2), BOARD_HEIGHT];
    p4 = [s(1)-height*(1/4), s(2)+width, BOARD_HEIGHT];
    p5 = [s(1)-height, s(2), BOARD_HEIGHT];
    plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
    plot3([p2(2), p3(2)], [p2(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
    plot3([p3(2), p4(2)], [p3(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
    plot3([p4(2), p5(2)], [p4(1), p5(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
    plot3([p5(2), p1(2)], [p5(1), p1(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
    find_path(p1,p2)
    find_path(p2,p3)
    find_path(p3,p4)
    find_path(p4,p5)
    find_path(p5,p1)
    
elseif(strcmp('triangle',type))
    prompt = 'centre at [x,y]: ';
    c = input(prompt);
    prompt = 'height: ';
    height = input(prompt);
    prompt = 'width: ';
    width = input(prompt);
    p1 = [c(1)+height/2, c(2), BOARD_HEIGHT]
    p2 = [c(1)-height/2, c(2)+width/2, BOARD_HEIGHT]
    p3 = [c(1)-height/2, c(2)-width/2, BOARD_HEIGHT]
    plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
    plot3([p2(2), p3(2)], [p2(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
    plot3([p3(2), p1(2)], [p3(1), p1(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
    find_path(p1,p2)
    find_path(p2,p3)
    find_path(p3,p1)
    
end
