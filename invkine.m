function angles = invkine(x1, y1, z1)
global L1;
global L2;
global L3;
% x_dis = 17.1;
% y_dis = 22.2;
% z_dis = 44;

%MOVE THE ORGIN
% x = x_dis - x1;
% y = y_dis - y1;
% z = z_dis - z1;

%NO TRANSLATION
x =  x1;
y =  y1;
z =  z1;

d = sqrt(x^2 + y^2);
f = sqrt(d^2 + (z-L1)^2);

g1 = asind(d/f);


if( x == 0 && y == 0)
    a1 = 0;
else 
    a1 = atand(y/x)+90;
end

% a1 = atand(x/y)+90;
a = acosd((L3^2 - L2^2 - f^2)/(-2*L2*f));
a2 = g1 - acosd((L3^2 - L2^2 - f^2)/(-2*L2*f));
a3 = 180 - acosd((f^2 - L2^2 - L3^2)/(-2*L2*L3));
b = acosd((f^2 - L2^2 - L3^2)/(-2*L2*L3));
g = acosd((L3^2 - L2^2 - f^2)/(-2*L2*f));

if(x < 0)
    a1 = a1-180;
end

% motor_angles(a1, a2, a3)
c = f_kine(a1, a2, a3);
c
l = f_kine(a1, a+g1, -a3);
l
% x_dis - c(1);
% y_dis - c(2);
% z_dis - c(3);
angles1 = [a1, a+g1, -a3]
% display('motor angles')
angles = [a1;a2;a3];