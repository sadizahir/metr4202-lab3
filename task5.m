function task5(type)


if (strcmp('line', type))
   prompt = 'Line start point [x,y,z]: ';
   s = input(prompt);
   prompt = 'Line end point [x,y,z]: ';
   e = input(prompt);
   find_path(s, e);
   
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
%     move_up();
elseif (strcmp('circle', type))
    prompt = 'Radius of circle in cm: ';
    r = input(prompt);
    prompt = 'centre of circle [x,y,z]: ';
    centre = input(prompt);
    no_p = r*4;
%     x = zeros(no_p+1,1);
%     y = zeros(no_p+1,1);
%     z = zeros(no_p+1,1);
    t = 0;
    c = zeros(no_p+1,3);
    for i = 1:no_p
        c(i,1) = centre(1) + r*cos(t);
        c(i,2) = centre(2) + r*sin(t);
        c(i,3) = centre(3);
%         c(i,1) = x(i);
%         c(i,2) = y(i);
%         c(i,3) = z(i);
        t = t + (2*pi)/no_p;
    end
%     x(no_p+1) = x(1);
%     y(no_p+1) = y(1);
%     z(no_p+1) = z(1);
%     move_up();
    c(no_p+1,1) = c(1,1);
    c(no_p+1,2) = c(1,2);
    c(no_p+1,3) = c(1,3);
    
    
    for i = 1:no_p
     find_path(c(i,:), c(i+1,:));
     display('moving from')
     c(i,:)
     display('to')
     c(i+1,:)
    end
    move_up();
%      mplot3(x,y,z)
    end
    
    
end
