video = VideoReader('3.mp4');
frames = read(video,[1 Inf]);

[M,N,D,F] = size(frames); % M, N, D and F are the number of rows, columns, dimensions and frame of the video respectively
plateNums = [""];

writerObj = VideoWriter('vid123.avi');

writerObj.FrameRate = 10;
% open the video writer
open(writerObj);

for i = 50:55
    finalFrame = detectPlateNumber(frames(:,:,:,i));
    frame = im2frame(finalFrame);

    writeVideo(writerObj, frame);
    plateNums(end+1) = plateNum;
end

plateNums = plateNums(2:end);

% close the writer object
close(writerObj);

