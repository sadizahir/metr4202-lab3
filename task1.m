worldPoints_path
l = size(worldPoints_path,1);
z = 46
coords = zeros(l, 3);

for i = 1:l
    coords(i,2) = worldPoints_path(i,1)/10;
    coords(i,1) = worldPoints_path(i,2)/10;
    coords(i,3) = z;
end
 coords(i + 1,2) = worldPoints_path(i,1)/10;
 coords(i + 1,1) = worldPoints_path(i,2)/10;
 coords(i + 1,3) = z;
 
 for i = 1:l+1
     find_path(coords(i,:), coords(i+1,:))
 end