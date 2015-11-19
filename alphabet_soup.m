function length = alphabet_soup(char,x,y,height)
global BOARD_HEIGHT

width = height*4/5;
length = width;

switch(char)
    case {'a', 'A'}
        p1 = [x-height, y, BOARD_HEIGHT]
        p2 = [x, y+width/2, BOARD_HEIGHT]
        find_path(p1,p2);
        move_up();
        p3 = [x-height, y+width, BOARD_HEIGHT]
        find_path(p2, p3);
        move_up();
        p4 = [x-(height/2), y+(width/4), BOARD_HEIGHT];
        p5 = [x-(height/2), y+(width*3/4), BOARD_HEIGHT];
        find_path(p4,p5)
        move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p2(2), p3(2)], [p2(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x')  
        plot3([p4(2), p5(2)], [p4(1), p5(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x')  
    case {'b', 'B'}
        p1 = [x,y, BOARD_HEIGHT]
        p2 = [x-height, y, BOARD_HEIGHT]
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  

        find_path(p1,p2)
        move_up();
        r = height/4;
        p3 = [x-r, y, BOARD_HEIGHT];
        find_path_circle(r,p3,0,pi)
        move_up();
        p4 = [x-(3*r), y, BOARD_HEIGHT];
        find_path_circle(r, p4, 0,pi)
        length = height/4;
        move_up();
    case {'c', 'C'}
        p1 = [x-(height/2), y+(width/2), BOARD_HEIGHT];
        r = height/2;
        find_path_circle(r, p1, pi*(3/4), pi*(11/8));
%         move_up();
    case {'d', 'D'}
        p1 = [x,y, BOARD_HEIGHT];
        p2 = [x-height, y, BOARD_HEIGHT];
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  

        find_path(p1,p2)
        move_up();
        r = height/2;
        p3 = [x-height/2, y, BOARD_HEIGHT];
        find_path_circle(r, p3, 0, pi)
        length = height/2;
        move_up();
    case {'e', 'E'}
        p1 = [x,y, BOARD_HEIGHT];
        p2 = [x-height, y, BOARD_HEIGHT];
        find_path(p1,p2)
        move_up();
        p3 = [x, y+width, BOARD_HEIGHT];
        find_path(p1,p3)
        move_up();
        p4 = [x-(height/2), y, BOARD_HEIGHT];
        p5 = [x-(height/2), y+(width/2), BOARD_HEIGHT];
        find_path(p4,p5)
        move_up();
        p6 = [x-height, y+width, BOARD_HEIGHT];
        find_path(p2, p6)
        move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p1(2), p3(2)], [p1(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x')  
        plot3([p4(2), p5(2)], [p4(1), p5(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x') 
        plot3([p2(2), p6(2)], [p2(1), p6(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x') 
    
    case {'f', 'F'}
        p1 = [x,y, BOARD_HEIGHT];
        p2 = [x-height, y, BOARD_HEIGHT];
        find_path(p1,p2)
        move_up();
        p3 = [x, y+width, BOARD_HEIGHT];
        find_path(p1,p3)
        move_up();
        p4 = [x-(height/2), y, BOARD_HEIGHT];
        p5 = [x-(height/2), y+(width/2), BOARD_HEIGHT];
        find_path(p4,p5)
        move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x') 
        plot3([p1(2), p3(2)], [p1(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x') 
        plot3([p4(2), p5(2)], [p4(1), p5(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x') 

    case {'g', 'G'}
        a = width/2;
        b = height/2;
        c = [x-b,y+a, BOARD_HEIGHT]
        s = find_path_ellipse(b,a,c,pi*(2/3), pi*(12/8));
        p1 = [s(1), s(2), s(3)]
        p2 = [x-height, s(2), BOARD_HEIGHT];
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x') 
%         p1 = [x+height/3, y+width, BOARD_HEIGHT];
%         find_path(p1,p2)
    case {'h', 'H'}
        p1 = [x,y, BOARD_HEIGHT];
        p2 = [x-height, y, BOARD_HEIGHT];
        find_path(p1,p2)
        move_up();
        p3 = [x, y+width, BOARD_HEIGHT];
        p4 = [x-height, y+width, BOARD_HEIGHT];
        find_path(p3,p4)
        move_up();
        p5 = [x-height/2, y, BOARD_HEIGHT];
        p6 = [x-height/2, y+width, BOARD_HEIGHT];
        find_path(p5,p6)
        move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p3(2), p4(2)], [p3(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x')  
        plot3([p5(2), p6(2)], [p5(1), p6(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x') 
    

    case {'i', 'I'}
        p1 = [x,y+width/4, BOARD_HEIGHT];
        p2 = [x-height, y+width/4, BOARD_HEIGHT];
        find_path(p1,p2)
        move_up();
        p3 = [x,y, BOARD_HEIGHT];
        p4 = [x, y+width/2, BOARD_HEIGHT];
        find_path(p3,p4)
        move_up();
        p5 = [x-height, y, BOARD_HEIGHT];
        p6 = [x-height, y+width/2, BOARD_HEIGHT];
        find_path(p5,p6)
        move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p3(2), p4(2)], [p3(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x')  
        plot3([p5(2), p6(2)], [p5(1), p6(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x') 
        length = width/2;
     case {'j', 'J'}
         r = height/3; 
         c = [x-(2*r), y+r, BOARD_HEIGHT];
         find_path_circle(r,c,pi/2,pi)
%          move_point(x+height-r, y+(2*r), BOARD_HEIGHT);
         
         p1 = [x, y+(2*r), BOARD_HEIGHT];
         p2 = [x-(2*r), y+(2*r), BOARD_HEIGHT];
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  

         find_path(p1,p2)
         
        move_up();
        length = 2*r;
     case {'k', 'K'}
         p1 = [x,y, BOARD_HEIGHT];
         p2 = [x-height, y, BOARD_HEIGHT];
         find_path(p1,p2)
         move_up();
         p3 = [x-height/2, y, BOARD_HEIGHT];
         p4 = [x, y+(width*3/4), BOARD_HEIGHT];
         find_path(p3,p4)
         move_up();
         p5 = [x-height, y+(width*3/4), BOARD_HEIGHT];
         find_path(p3, p5)
         move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p3(2), p4(2)], [p3(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x')  
        plot3([p3(2), p5(2)], [p3(1), p5(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x') 

     case {'l', 'L'}
         p1 = [x,y, BOARD_HEIGHT];
         p2 = [x-height, y, BOARD_HEIGHT];
         find_path(p1,p2)
         move_up();
         p3 = [x-height, y+width, BOARD_HEIGHT];
         find_path(p2,p3)
         move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p2(2), p3(2)], [p2(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x')  
       
     case {'m', 'M'}
         p1 = [x,y, BOARD_HEIGHT];
         p2 = [x-height,y, BOARD_HEIGHT];
         find_path(p1,p2)
         p3 = [x-height/4, y+width/2, BOARD_HEIGHT];
         find_path(p1,p3)
         p4 = [x, y+width, BOARD_HEIGHT];
         find_path(p3,p4)
         p5 = [x, y+width, BOARD_HEIGHT];
         find_path(p4,p5)
         p6 = [x-height, y+width, BOARD_HEIGHT];
         find_path(p5,p6)
         move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p1(2), p3(2)], [p1(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x')  
        plot3([p3(2), p4(2)], [p3(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p4(2), p5(2)], [p4(1), p5(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x')  
        plot3([p5(2), p6(2)], [p5(1), p6(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
       
     case {'n', 'N'}
         p1 = [x,y, BOARD_HEIGHT];
         p2 = [x-height,y, BOARD_HEIGHT];
         find_path(p1,p2)
         p3 = [x, y+width, BOARD_HEIGHT];
         find_path(p1,p4)
         p4 = [x-height, y+width, BOARD_HEIGHT];
         find_path(p3,p4)
         move_up();
       plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p1(2), p4(2)], [p1(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT], '-x')  
        plot3([p3(2), p4(2)], [p3(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
    
     case {'o', 'O', '0'}
        a = width/2;
        b = height/2;
        c = [x-b,y+a, BOARD_HEIGHT];
        find_path_ellipse(b,a,c,0,2*pi)
        move_up();
     case {'p', 'P'}
        p1 = [x,y, BOARD_HEIGHT];
        p2 = [x-height, y, BOARD_HEIGHT];
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        a = width*3/4;
        b = height/4;
        c = [x-b,y, BOARD_HEIGHT];
        find_path_ellipse(b,a,c,0,pi)
        find_path(p1,p2)
        move_up();
        length = a;
     case {'q', 'Q'}
        a = width/2;
        b = height/2;
        c = [x-b,y+a, BOARD_HEIGHT];
        find_path_ellipse(b,a,c,0,2*pi) 
        move_up();
        p1 = [x-height, y+width, BOARD_HEIGHT];
        plot3([c(2), p1(2)], [c(1), p1(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  

        find_path(c, p1)
        move_up();
     case {'r', 'R'}
        p1 = [x,y, BOARD_HEIGHT];
        p2 = [x-height, y, BOARD_HEIGHT];
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  

        find_path(p1,p2)
        move_up();
        a = width*3/4;
        b = height/4;
        c = [x-b,y, BOARD_HEIGHT];
        find_path_ellipse(b,a,c,0,pi)
        move_up();
        p4 = [x-(height/2), y, BOARD_HEIGHT];
        p5 = [x-height, y+a, BOARD_HEIGHT];
        plot3([p4(2), p5(2)], [p4(1), p5(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        length = a;
        find_path(p4,p5)
        move_up();
     case {'s', 'S'}
        a1 = width/2;
        b1 = height/4;
        c1 = [x-b1,y+a1, BOARD_HEIGHT];
        find_path_ellipse(b1,a1,c1,pi,pi)
        a2 = width/2;
        b2 = height/4;
        c2 = [x-3*b2,y+a2, BOARD_HEIGHT];
        find_path_ellipse(b2,a2,c2,0,pi)
        p1 = [x,y+a1,BOARD_HEIGHT];
        p2 = [x,y+2*a1, BOARD_HEIGHT];
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        p3 = [x-height,y+a2,BOARD_HEIGHT];
        p4 = [x-height,y, BOARD_HEIGHT];
        plot3([p3(2), p4(2)], [p3(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x') 
         move_up();
     case {'t', 'T'}
         p1 = [x,y, BOARD_HEIGHT];
         p2 = [x, y+width, BOARD_HEIGHT];
         find_path(p1,p2)
         move_up();
         p3 = [x, y+width/2, BOARD_HEIGHT];
         p4 = [x-height, y+width/2, BOARD_HEIGHT];
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p3(2), p4(2)], [p3(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
         find_path(p3,p4)
         move_up();
     case {'u', 'U'}
         r = height/4;
         p1 = [x,y, BOARD_HEIGHT];
         p2 = [x-r*3, y, BOARD_HEIGHT];
         find_path(p1,p2)
         move_up();
         c = [x-3*r, y+r, BOARD_HEIGHT];
         find_path_circle(r,c,pi/2,pi)
         p3 = [x-r*3, y+2*r, BOARD_HEIGHT];
         p4 = [x, y+2*r, BOARD_HEIGHT];
         find_path(p3,p4)
         move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p3(2), p4(2)], [p3(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  

         length = 2*r;
     case {'v', 'V'}
         p1 = [x,y, BOARD_HEIGHT];
         p2 = [x-height, y+width/2, BOARD_HEIGHT];
         find_path(p1, p2)
         p3 = [x, y+width, BOARD_HEIGHT];
         find_path(p2,p3)
         move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p2(2), p3(2)], [p2(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  

     case {'w', 'W'}
         p1 = [x,y, BOARD_HEIGHT];
         p2 = [x-height, y+width/4, BOARD_HEIGHT];
         find_path(p1,p2)
         p3 = [x-height/2, y+width/2, BOARD_HEIGHT];
         find_path(p2,p3)
         p4 = [x-height, y+width*3/4, BOARD_HEIGHT];
         find_path(p3,p4)
         move_up();
        p5 = [x, y+width, BOARD_HEIGHT];
          find_path(p4,p5)
         move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p2(2), p3(2)], [p2(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p3(2), p4(2)], [p3(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p4(2), p5(2)], [p4(1), p5(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  

     case {'x', 'X'}
         p1 = [x,y, BOARD_HEIGHT];
         p2 = [x-height, y+width, BOARD_HEIGHT];
         find_path(p1,p2)
         move_up();
         p3 = [x-height, y, BOARD_HEIGHT];
         p4 = [x, y+width, BOARD_HEIGHT];
         find_path(p3,p4)
         move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p3(2), p4(2)], [p3(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  

     case {'y', 'Y'}
         p1 = [x,y, BOARD_HEIGHT];
         p2 = [x-height/3, y+width/2, BOARD_HEIGHT];
         find_path(p1,p2)
         p3 = [x-height, y+width/2, BOARD_HEIGHT];
         find_path(p2,p3)
         move_up();
         p4 = [x, y+width, BOARD_HEIGHT];
         find_path(p2,p4)
         move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p2(2), p3(2)], [p2(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p2(2), p4(2)], [p2(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  

     case {'z', 'Z'}
         p1 = [x,y, BOARD_HEIGHT];
         p2 = [x, y+width, BOARD_HEIGHT];
         find_path(p1,p2)
         p3 = [x-height, y, BOARD_HEIGHT];
         find_path(p2,p3)
         p4 = [x-height, y+width, BOARD_HEIGHT];
         find_path(p3,p4)
         move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p2(2), p3(2)], [p1(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p3(2), p4(2)], [p3(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        
    case '?'
        r = height/4
        c = [x-r, y+r, BOARD_HEIGHT];
        e = find_path_circle(r,c,pi*(3/2),pi*(3/2))
        p1 = [e(1), e(2), e(3)]
        p2 = [x-3*r, e(2), BOARD_HEIGHT]
        find_path(p1,p2)
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3(e(2), x-height,BOARD_HEIGHT,'-x') 
        move_point(x-height, e(2), BOARD_HEIGHT)
        length = r*2;
    case '!'
        p1 = [x,y+width/4, BOARD_HEIGHT];
        p2 = [x-(height*3/4), y+width/4, BOARD_HEIGHT];

        find_path(p1,p2)
        move_up();
        move_point(x-height, y+width/4, BOARD_HEIGHT)
        move_up();
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3(y+width/4, x-height,BOARD_HEIGHT,'-x')  
        length = width/4;
    case '%'
        display('no % yet')
        p1 = [x, y+width, BOARD_HEIGHT]
        p2 = [x-height, y, BOARD_HEIGHT]
        find_path(p1,p2)
        r = width/6;
        c1 = [x-height/4, y+width/4, BOARD_HEIGHT]
        find_path_circle(r,c1,0,2*pi)
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        c2 = [x-height*3/4, y+width*3/4, BOARD_HEIGHT]
        find_path_circle(r,c2,0,2*pi)
        
    case '1'
        p1 = [x-height/4, y, BOARD_HEIGHT]
        p2 = [x, y+width/4, BOARD_HEIGHT]
        p3 = [x-height, y+width/4, BOARD_HEIGHT]
        p4 = [x-height, y, BOARD_HEIGHT]
        p5 = [x-height, y+width/2, BOARD_HEIGHT]
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p2(2), p3(2)], [p2(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p4(2), p5(2)], [p4(1), p5(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        find_path(p1,p2)
        find_path(p2,p3)
        find_path(p4,p5)

        length = width/2;
    case '2'
        a = width/2;
        b = height/4;
        c = [x-b,y+a, BOARD_HEIGHT];
        find_path_ellipse(b,a,c,pi*(3/2),pi*(3/2))
        p1 = [x-height/2, y+width/2, BOARD_HEIGHT]
        p2 = [x-height, y, BOARD_HEIGHT]
        p3 = [x-height, y+width, BOARD_HEIGHT]
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p2(2), p3(2)], [p2(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  

    case '3'
        a1 = width/2;
        b1 = height/4;
        c1 = [x-b1,y+a1, BOARD_HEIGHT];
        find_path_ellipse(b1,a1,c1,pi*(3/2),pi*(3/2))
        a2 = width/2;
        b2 = height/4;
        c2 = [x-3*b2,y+a2, BOARD_HEIGHT];
        find_path_ellipse(b2,a2,c2,0,pi*(3/2))

    case '4'
        p1 = [x, y+width*(3/4), BOARD_HEIGHT]
        p2 = [x-height/2, y, BOARD_HEIGHT]
        p3 = [x-height/2, y+width, BOARD_HEIGHT]
        p4 = [x-height, y+width*(3/4), BOARD_HEIGHT]
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p2(2), p3(2)], [p2(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p1(2), p4(2)], [p1(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        find_path(p1,p2)
        find_path(p2,p3)
        find_path(p1,p4)

        
    case '5'
        p1 = [x, y+width, BOARD_HEIGHT]
        p2 = [x, y, BOARD_HEIGHT]
        p3 = [x-height/2, y, BOARD_HEIGHT]
        a = width/2;
        b = height/4;
        c = [x-3*b,y+a, BOARD_HEIGHT];
        find_path_ellipse(b,a,c,0,pi*(3/2))
        p4 = [x-height/2, y+width/2, BOARD_HEIGHT]
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p2(2), p3(2)], [p2(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p3(2), p4(2)], [p3(1), p4(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        find_path(p1,p2)
        find_path(p2,p3)
        find_path(p3,p4)

        
    case '6'
        a1 = width/2;
        b1 = height/4;
        c1 = [x-b1,y+a1, BOARD_HEIGHT];
        find_path_ellipse(b1,a1,c1,pi*(3/2),pi)
        a2 = width/2;
        b2 = height/4;
        c2 = [x-3*b2,y+a2, BOARD_HEIGHT];
        find_path_ellipse(b2,a2,c2,0,2*pi)
        p1 = [x-b1, y, BOARD_HEIGHT]
        p2 = [x-3*b1, y, BOARD_HEIGHT]
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        find_path(p1,p2)

    case '7'
        p1 = [x,y,BOARD_HEIGHT]
        p2 = [x, y+width, BOARD_HEIGHT]
        p3 = [x-height,y,BOARD_HEIGHT]
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        plot3([p2(2), p3(2)], [p2(1), p3(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')  
        find_path(p1,p2)
        find_path(p2,p3)

    case '8'
        a1 = width/2;
        b1 = height/4;
        c1 = [x-b1,y+a1, BOARD_HEIGHT];
        find_path_ellipse(b1,a1,c1,0,2*pi)
        a2 = width/2;
        b2 = height/4;
        c2 = [x-3*b2,y+a2, BOARD_HEIGHT];
        find_path_ellipse(b2,a2,c2,0,2*pi)

        
    case '9'
        a1 = width/2;
        b1 = height/4;
        c1 = [x-b1,y+a1, BOARD_HEIGHT];
        find_path_ellipse(b1,a1,c1,0,2*pi)
        a2 = width/2;
        b2 = height/4;
        c2 = [x-3*b2,y+a2, BOARD_HEIGHT];
        find_path_ellipse(b2,a2,c2,pi/2,pi)
        p1 = [x-b1, y+width, BOARD_HEIGHT]
        p2 = [x-3*b1, y+width, BOARD_HEIGHT]
        plot3([p1(2), p2(2)], [p1(1), p2(1)],[BOARD_HEIGHT,BOARD_HEIGHT],'-x')
        find_path(p1,p2)
    case ' '
        length = 2;
end
