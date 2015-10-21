clear;
cam = webcam(2);
cam.Resolution = '320x240';
preview(cam);
pause;
% im = imread('practice4.jpg'); % load the image

im = snapshot(cam);

% some random sample points pre-selected to land on the hand
%box_width = 50;
%box_height = 50;
%coords = [128 115];
channel3min = 255;

imshow(im);
coords = getrect;

% draw the box onto the image

rim = insertShape(im, 'rectangle', [coords]);

coords = uint8(coords);

imshow(rim);
pause;

% now we have to work out the minimum and maximum of each channel from the
% boxes
yim = rgb2ycbcr(im);
bim = zeros(size(yim(:,:,3), 1), size(yim(:,:,3), 2));

for i = coords(2):coords(2)+coords(4)
    for j = coords(1):coords(1)+coords(3)
        if yim(i, j, 3) < channel3min
            channel3min = yim(i, j, 3);
        end
    end
end

channel3min = channel3min - 10;

for i = 1:size(yim(:,:,3), 1)
    for j = 1:size(yim(:,:,3), 2)
        if yim(i, j, 3) > channel3min
            bim(i, j) = 1;
            im(i, j, :) = 255;
        else
            bim(i, j) = 0;
        end
    end
end

bw = edge(bim, 'canny');

imshow(bim);
clear;