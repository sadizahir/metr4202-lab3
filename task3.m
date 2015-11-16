%Acupuncture
% 
% run('detector.m')

bbox = [210    67    60    64];

bandaid_pt = [250 60; 100 80; 250 100];
l = size(bandaid_pt,1);
z = 46;
coords = zeros(l, 3);

xmin = bbox(1);
ymin = bbox(2);
xmax = xmin + bbox(3);
ymax = ymin + bbox(4);

j = 1;

%specify neutral point in centre of bounding box
neutral = [0,0,30];

for i = 1:l
    x = bandaid_pt(i,1);
    y = bandaid_pt(i,2);
    
    if xmax > x && x > xmin && ymax > y && y > ymin 
            coords(j,2) = bandaid_pt(i,1)/10;
            coords(j,1) = bandaid_pt(i,2)/10;
            coords(j,3) = z;
            j = j + 1;
    end    
end
 
 coords
 
 angle = 0
 for i = 1:j
    find_path(coords(i,:), coords(i+1,:))
    flag = 0;
    i
  %% Put in prompt to determine if arrangement is acceptable
    while flag == 0
        prompt = 'Is the alignment correct? y/n [y]: ';
        str = input(prompt,'s');
        if isempty(str)
            str = 'Y';
        end
        %i
        if str == 'y'
            flag = 1;
            display('Final angle');
            
            angle
            display('Placing bandage..');
            
           % place bandaid
            move_point(coords(i,1), coords(i,2), 46);
           
           % move arm to neutral point
            move_point(0, 0, 30);
            
           % find start of bandaid
            
           
           % return to start position
        elseif str == 'n'
             angle = angle + 15      
            %wrap around angle at 360 degrees
            if angle == 360 
                angle = 0;
            end                    
        else         
            display('Please enter "y" or "n"');
        end
    end
 end
    