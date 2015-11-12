function task5(type)


if (strcmp('line', type))
   prompt = 'Line start point [x,y,z]: ';
   s = input(prompt);
   prompt = 'Line end point [x,y,z]: ';
   e = input(prompt);
   find_path(s, e);
   
elseif (strcmp('square', type))
    square = zeros(4,3);
    prompt = 'first corner of square [x,y,z]: ';
    square(1,:) = input(prompt);
    prompt = 'second corner of square [x,y,z]: ';
    square(2,:) = input(prompt);
    prompt = 'third corner of square [x,y,z]: ';
    square(3,:) = input(prompt);
    prompt = 'third corner of square [x,y,z]: ';
    square(4,:) = input(prompt);
    for i = 1:3
     find_path(square(i,:), square(i+1,:));
    end
    find_path(square(3,:), square(4,:));
elseif (strcmp('circle', type))
    prompt = 'Radius of circle in cm: ';
    r = input(prompt);
    prompt = 'centre of circle [x,y,z]: ';
    centre = input(prompt);
    no_p = r*4;
    x = zeros(no_p+1,1);
    y = zeros(no_p+1,1);
    z = zeros(no_p+1,1);
    t = 0;
    c = zeros(no_p+1,3);
    
    for i = 1:no_p
        x(i) = centre(1) + r*cos(t);
        y(i) = centre(2) + r*sin(t);
        z(i) = centre(3);
        c(i,1) = x(i);
        c(i,2) = y(i);
        c(i,3) = z(i);
        t = t + (2*pi)/no_p;
    end
    x(no_p+1) = x(1);
    y(no_p+1) = y(1);
    z(no_p+1) = z(1);
    c(no_p+1,1) = x(1);
    c(no_p+1,2) = y(1);
    c(no_p+1,3) = z(1);
    
    
    for i = 1:no_p+1
     find_path(c(i,:), c(i+1,:));
    end
    
    
    plot3(x,y,z)
end
