%CLEAN UP
%Unloads the library and disconnects the dynamixels

% clean up
calllib('dynamixel','dxl_terminate');
unloadlibrary('dynamixel');