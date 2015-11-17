% To access coordinates of the path, go to rvtools\robot\PRM.m
%

tic
%clc
% clear
%im=imread('obstacles4.bmp');


%Load the calibration parameters
load('d:\code\cal.mat'); 
load('d:\code\local.mat');


% CANNY EDGE

%vid1 = imaq.VideoDevice('kinectv2imaq', 1);

orig_img = (imresize(step(vid1), [240 450]));
[img ,~] = undistortImage(orig_img, cameraParams, 'OutputView', 'full');
gimg = rgb2gray(img);
im = edge(gimg, 'canny');
square = strel('square',2);
im = imdilate(im, square);

%dist=((worldPoints_path(1)-worldPoints_path(3))^2 + ((worldPoints_path(4)-worldPoints_path(6))^2))^0.5

% zero padding for square image
im = double(im);
d = size(im);

% im = uint8(im);
% im = im*255;
% im = cat(3, im,im,im);

imshow(im)


if d(1,1) > d(1,2)
    for n = d(1,2) + 1 : d(1,1)
        im(:,n) = 1;
    end

elseif d(1,1) < d(1,2)
    for n = d(1,1) + 1 : d(1,2)
        im(n,:) = 1;
    end    
end

clearvars n d;

%im = imrotate(im,180);

imshow(im)

% Peter Corke
prm = PRM(im,'npoints', 120);

imshow(img)

start_h = impoint %[138,215];       
start   =  round(getPosition(start_h))  %round(start)       %round(getPosition(start_h)) %[152,147]; 

goal_h =  impoint %[315,194];      
goal   =  round(getPosition(goal_h))    % round(goal)    %round(getPosition(goal_h))  %[315,70];
%prm = PRM(map);        % create navigation object
%prm.display() 
prm.char()

x=0;
while 1
    try
        prm.plan()               % create roadmap
        prm.path(start, goal)  % animate path from this start location
        set(gca,'Ydir','reverse')
        set(gca,'Xdir','reverse')
        break
    catch
        disp('No path found, trying again...')
        x=x+1;
        if x == 5
            break
        end    
    end
end

m = prm.graph.path(prm.vstart);

%create table of points including start and goal points
p = zeros(size(m, 2) + 2, 2);

%append start points to path
p(1,:) = start;

%append calculated path

for i = 2:(size(m, 2)+ 1)      
    p(i,:) = prm.graph.coord(m(i-1))' ;
end

%append goal to path
p(size(m, 2) + 2,:) = goal;

%convert to world points
worldPoints_path = pointsToWorld(cameraParams,R,t,p)
% for i = 1: size(worldPoints_path,2)
%     worldPoints_path(i,:) = worldPoints_path(i,:) %- [centralFrame(1,3),centralFrame(1,1)];
% end
% worldPoints_path
toc