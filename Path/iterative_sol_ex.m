load('local.mat');
desired = [0 0];
epsilon = 1.0;
found = 0;
tic
for i = 1:320
    if found == 1
        break
    end
    for j = 1:240
        pw = pointsToWorld(cameraParams, R, t, [i j]);
        if abs(pw(1)-desired(1)) < epsilon
            if abs(pw(2)-desired(2)) < epsilon
                found = 1;
                break;
            end
        end
    end
end
toc