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
    %square(1,:) = input(prompt);
    init_coords = input(prompt)
    prompt = 'side length in cm: ';
    l = input(prompt);
    c2 = [init_coords(1)+l, init_coords(2), init_coords(3)];
    find_path(init_coords, c2);
    c3 = [init_coords(1)+l, init_coords(2)+l, init_coords(3)];
    find_path(c2, c3);
    c4 = [init_coords(1), init_coords(2)+l, init_coords(3)];
    find_path(c3, c4);
    find_path(c4, init_coords);

    for l=l:-0.5:1
        
        square(1,:) = init_coords;
        square(2,:) = init_coords + [l,0,0];
        square(3,:) = init_coords + [l,l,0];
        square(4,:) = init_coords + [0,l,0];

        find_path(square(1,:), square(2,:))
        find_path(square(2,:), square(3,:))
        find_path(square(3,:), square(4,:))
        find_path(square(4,:), square(1,:))

        x = zeros(4+1,1);
        y = zeros(4+1,1);
        z = zeros(4+1,1);


        for i = 4:-1:1
            x(i,1) = square(i,1);
            y(i,1) = square(i,2);
            z(i,1) = square(i,3);
        end

        x(5,1)=square(1,1);
        y(5,1)=square(1,2);
        z(5,1)=square(1,3);

        hold on
        plot3(x,y,z)
    end
 
%     prompt = 'second corner of square [x,y,z]: ';
%     square(2,:) = input(prompt);
%     prompt = 'third corner of square [x,y,z]: ';
%     square(3,:) = input(prompt);
%     prompt = 'third corner of square [x,y,z]: ';
%     square(4,:) = input(prompt);
%     
%     
%     
%     for i = 1:3
%      find_path(square(i,:), square(i+1,:));
%     end
%     find_path(square(3,:), square(4,:));
    
    
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
    
    for r = r:-0.5:1
        for i = 1:no_p
        c(i,1) = centre(1) + r*cos(t);
        c(i,2) = centre(2) + r*sin(t);
        c(i,3) = centre(3);
%             c(i,1) = x(i);
%             c(i,2) = y(i);
%             c(i,3) = z(i);
        t = t + (2*pi)/no_p;
        end
%         x(no_p+1) = x(1);
%         y(no_p+1) = y(1);
%         z(no_p+1) = z(1);
    c(no_p+1,1) = c(1,1);
    c(no_p+1,2) = c(1,2);
    c(no_p+1,3) = c(1,3);

        hold on
%         plot3(x,y,z)

         for i = 1:no_p
             find_path(c(i,:), c(i+1,:));
             display('moving from')
             c(i,:)
             display('to')
             c(i+1,:)
         end
    end
    for i = 1:no_p
         find_path(c(i,:), c(i+1,:));
         display('moving from')
         c(i,:)
         display('to')
         c(i+1,:)
    end
    
end
