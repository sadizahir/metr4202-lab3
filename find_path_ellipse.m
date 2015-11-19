function start = find_path_ellipse(a,b,c, t1, t2)
%x = acos(t)
%y = bsint(t)

    no_p = round(5*b);
    x = zeros(no_p+1,1);
    y = zeros(no_p+1,1);
    z = zeros(no_p+1,1);
    t = t1;
    elipse = zeros(no_p+1,3);
    
    for i = 1:no_p+1
        y(i) = c(1) + b*cos(t);
        x(i) = c(2) + a*sin(t);
        z(i) = c(3);
        elipse(i,1) = y(i);
        elipse(i,2) = x(i);
        elipse(i,3) = z(i);
        t = t + t2/no_p;
    end
    start = elipse(1,:);
    plot3(x,y,z, '-x')
    for i = 1:no_p
        find_path(elipse(i,:), elipse(i+1,:))
    end
    elipse
end
