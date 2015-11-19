function e = find_path_circle(r, c, t1, t2)
    r
    no_p = 5*r;
    x = zeros(no_p+1,1);
    y = zeros(no_p+1,1);
    z = zeros(no_p+1,1);
    t = t1;
    circle = zeros(no_p+1,3);
    
    for i = 1:no_p+1
        y(i) = c(1) + r*cos(t);
        x(i) = c(2) + r*sin(t);
        z(i) = c(3);
        circle(i,1) = y(i);
        circle(i,2) = x(i);
        circle(i,3) = z(i);
        t = t + t2/no_p;
    end
    e = circle(no_p+1,:);
    plot3(x,y,z, '-x')
    for i = 1:no_p
        find_path(circle(i,:), circle(i+1,:))
    end
end



