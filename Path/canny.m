vid1 = imaq.VideoDevice('kinectv2', 1);
while true
    img = (imresize(step(vid1), [240 450]));
    gimg = rgb2gray(img);
    bw = edge(gimg, 'canny');
    imshow(bw, 'InitialMagnification', 300);
end
