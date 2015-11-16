%Acupuncture
% 
% run('detector.m')

bbox = [210    67    60    64];

acupuncture_pts = [250 60; 100 80; 250 100]
l = size(acupuncture_pts,1);
z = 46
coords = zeros(l, 3);

xmin = bbox(1)
ymin = bbox(2)
xmax = xmin + bbox(3)
ymax = ymin + bbox(4)

j = 1

%specify neutral point in centre of bounding box

for i = 1:l
    x = acupuncture_pts(i,1)
    y = acupuncture_pts(i,2)
    
    if xmax > x && x > xmin && ymax > y && y > ymin 
            coords(j,2) = acupuncture_pts(i,1)/10;
            coords(j,1) = acupuncture_pts(i,2)/10;
            coords(j,3) = z;
            j = j + 1;
    end    
end
 
 coords 
%  for i = 1:j
%      find_path(coords(i,:), coords(i+1,:))
%  end