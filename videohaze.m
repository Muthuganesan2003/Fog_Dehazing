% Read the input video
inputVideo = VideoReader('haze1.mp4');

% Initialize the output video
outputVideo = VideoWriter('output_video.avi');
open(outputVideo);

% Set the brightness gain (value between 0 and 1 for decreasing brightness, or greater than 1 for increasing brightness)
brightnessGain = 1.2;

% Loop through all frames in the input video
while hasFrame(inputVideo)
    
    % Read the current frame
    frame = readFrame(inputVideo);
    
    % Dehaze the frame
    dehazedFrame = imreducehaze(frame);
    
    % Increase the brightness of the frame
    brightenedFrame = imadjust(dehazedFrame, [], [], brightnessGain);
    
    % Write the processed frame to the output video
    writeVideo(outputVideo, brightenedFrame);
end

% Close the output video
close(outputVideo);
