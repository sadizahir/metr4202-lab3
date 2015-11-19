function angles = invkine4(x,y,z)
global L1;
global L2;
global L3;
%t1 begins at 360 (0)
%t2 is a negative angle
%t3 is a positive angle


%Q1 is inverse arm of Q2 at same angle
%Q3 is inverse arm of Q4 at same angle


%Q1 - t1 360 -> 270      +x +y 
%Q2 - t1 -90 -> -180     -x +y
%Q3 - t1 -90 -> 0        -x -y
%Q4 - t1  180 -> 270     +x -y 


if (x == 0 && y == 0)
%     display('on centre line')
elseif (x >= 0 && y >= 0)
%     display('Q1')
elseif (x >= 0 && y <= 0)
%         display('Q2')
elseif (x <= 0 && y <= 0)
%         display('Q3')
elseif (x <= 0 && y >= 0)
%         display('Q4')
end

d = sqrt(x^2 + y^2);
f = sqrt(d^2 + (z-L1)^2);

if (x < 0)
    g = asind(-d/f);
else
    g = asind(d/f);
end

t = atan2d(y,x)+90;

if (t <= 180)
    t1 = t +180;
else
    t1 = t - 180;
end


a = acosd((L3^2 - L2^2 - f^2)/(-2*L2*f));
b = 180 - acosd((f^2 - L2^2 - L3^2)/(-2*L2*L3));


t2 = -a-g;

if (x < 0)
    t1 = t1 - 180;  %%Check this?!?!?!
end

t3 = b;

f_kine(t1,t2,t3)';

angles = [t1, t2, t3];
% motor_angles_packet(t1,t2,t3)

