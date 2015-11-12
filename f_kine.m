%Finds the co-ordinate position in xyz from angles t1, t2, t3
function coords = f_kine(t1, t2, t3)

% Grab the global link lengths.
global L1;
global L2;
global L3;

coords = [L3*(cosd(t2)*sind(t1)*sind(t3) + cosd(t3)*sind(t1)*sind(t2)) + L2*sind(t1)*sind(t2);
    - L3*(cosd(t1)*cosd(t2)*sind(t3) + cosd(t1)*cosd(t3)*sind(t2)) - L2*cosd(t1)*sind(t2);
                          L1 + L3*(cosd(t2)*cosd(t3) - sind(t2)*sind(t3)) + L2*cosd(t2);
                          1];

%a = rotz_d(t1)*trans(0,0,L1)*rotx_d(t2)*trans(0,0,L2)*rotx_d(t3)*trans(0,0,L3)*[0;0;0;1];


% coords =[L1*cos(t1) - L3*(cos(t1)*sin(t2)*sin(t3) - cos(t1)*cos(t2)*cos(t3)) + L2*cos(t1)*cos(t2);
%     L1*sin(t1) - L3*(sin(t1)*sin(t2)*sin(t3) - cos(t2)*cos(t3)*sin(t1)) + L2*cos(t2)*sin(t1);
%     - L3*(cos(t2)*sin(t3) + cos(t3)*sin(t2)) - L2*sin(t2)];
% 
% 
% coords2 = [L3*(cosd(t1)*cosd(t2)*sind(t3) + cosd(t1)*cosd(t3)*sind(t2)) + L2*cosd(t1)*sind(t2);
%      L3*(cosd(t2)*sind(t1)*sind(t3) + cosd(t3)*sind(t1)*sind(t2)) + L2*sind(t1)*sind(t2);
%                     L1 + L3*(cosd(t2)*cosd(t3) - sind(t2)*sind(t3)) + L2*cosd(t2);
%                     1]
               


% coords = [L1*cos(t1) + L3*(cos(t1)*cos(t2)*sin(t3) + cos(t1)*cos(t3)*sin(t2)) + L2*cos(t1)*sin(t2);
%     L1*cos(t1) + L3*(cos(t1)*cos(t2)*sin(t3) + cos(t1)*cos(t3)*sin(t2)) + L2*cos(t1)*sin(t2);
%     L3*(cos(t2)*cos(t3) - sin(t2)*sin(t3)) + L2*cos(t2)];
%     