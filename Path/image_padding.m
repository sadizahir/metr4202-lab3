clear

im=imread('obstacles2.bmp');

% zero padding for square image
d = size(im);



if d(1,1) > d(1,2)
    for n = d(1,2) + 1 : d(1,1)
        im(:,n) = 1;
    end

elseif d(1,1) < d(1,2)
    for n = d(1,1) + 1 : d(1,2)
        im(n,:) = 1;
    end    
else
    continue
end
imshow(im);