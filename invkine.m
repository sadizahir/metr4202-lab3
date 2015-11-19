function angles = invkine(x, y, z)
% d = sqrt(x^2 + y^2);

z = z + (abs(x)/20);



if (x < 0)
    angles = invkine4(x,y,z);
else
    angles = invkine1(x,y,z);
end
