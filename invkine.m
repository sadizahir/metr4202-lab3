function angles = invkine(x, y, z)
% d = sqrt(x^2 + y^2);

z = z + (abs(x)/20);

x
y
z

if (x < 0)
    display('invkine4')
    angles = invkine4(x,y,z);
else
    display('invkine1')
    angles = invkine1(x,y,z);
end
