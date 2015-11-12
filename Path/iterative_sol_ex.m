
%Load localisation parameters
load('local.mat');

%Set desired start point
desired_start = [0 0];

%Set desired end point
desired_end = [100 100];

epsilon = 1.0;
found = 0;

%start clock
tic
for i = 1:320
    if found == 1
        break
    end
    for j = 1:240
        world_start = pointsToWorld(cameraParams, R, t, [i j]);
        if abs(world_start(1)-desired_start(1)) < epsilon
            if abs(world_start(2)-desired_start(2)) < epsilon
                found = 1;
                break;
            end
        end
    end
end
toc

%reset conditions
epsilon = 1.0;
found = 0;

%restart clock
tic
for i = 1:320
    if found == 1
        break
    end
    for j = 1:240
        world_end = pointsToWorld(cameraParams, R, t, [i j]);
        if abs(world_end(1)-desired_end(1)) < epsilon
            if abs(world_end(2)-desired_end(2)) < epsilon
                found = 1;
                break;
            end
        end
    end
end
toc
world_start
world_end
