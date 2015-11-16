function angles = invkine1(x,y,z)
%t1 begins at 180
%t2 is a negative angle
%t3 is a positive angle

%Q1 is inverse arm of Q2 at same angle
%Q3 is inverse arm of Q4 at same angle

%Q1 - t1 90 -> 180    +x +y
%Q2 - t1 0 -> 90      -x +y
%Q3 - t1 -180 -> -270 -x -y  (90->180)??
%Q4 - t1 0 -> 90      +x -y

global L1;
global L2;
global L3;
% x = x - 3;


% if (x == 0 && y == 0)
%     display('on centre line')
%     x = x - 2.5;
%     y = y - 2;
% elseif (x > 0 && y > 0)
%     display('Q1')
%     x = x;% + 3.5;
%     y = y - 1;
% elseif (x < 0 && y >= 0)
%      display('Q2')
%      x = x - 2.5;
%      y = y + 1;
% elseif (x < 0 && y < 0)
%      display('Q3')
%      x = x;% + 2.5;
%      y = y - 5.5;
% elseif (x > 0 && y < 0)
%      display('Q4')
%      x = x + 3.5;
%      y = y + 1;
% end

d = sqrt(x^2 + y^2);
f = sqrt(d^2 + (z-L1)^2);

if (x < 0)
    g = asind(-d/f);
else
    g = asind(d/f);
end

t1 = atan2d(y,x)+90;


a = acosd((L3^2 - L2^2 - f^2)/(-2*L2*f));
b = 180 - acosd((f^2 - L2^2 - L3^2)/(-2*L2*L3));


t2 = g-a;

if (x < 0)
    t1 = t1 - 180;  %%Check this?!?!?!
end

t3 = b;

f_kine(t1,t2,t3)';
angles = [t1, t2, t3];
% motor_angles_packet(t1,t2,t3)




