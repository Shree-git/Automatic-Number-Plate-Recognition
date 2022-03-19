% Hysteresis Thresholding
img = imread("BinaryImage.png");

T1 = 0.1;
T2 = 0.9;
aboveT2 = img > T2;

[aboveT1Row, aboveT1Col] = find(img > T1);

bw = bwselect(aboveT2, aboveT1Col, aboveT1Row, 8);

finalImg = bw - img;
imshow(finalImg);


% Non-linear Majority Filter
outputImg = img;
[M,N] = size(img);
W = 2; % W is the window size. I changed the window sizes to different values to get data.
step = floor(W/2);
for i = 1+step:M-step
    for j = 1+step: N-step
        window = img((i-step):(i+step), (j-step):(j+step));
        window = window(:);
        outputImg(i,j) = mode(window);
    end
end

numOfPixelsSelected = 0;
for i=1:numel(outputImg)
    numOfPixelsSelected = numOfPixelsSelected + outputImg(i);
end

numOfPixelsSelected

DisconnectedClusters = bwconncomp(outputImg);
numOfDisconnectedClusters = DisconnectedClusters.NumObjects

% I collected a lot of images with different window sizes. This is only one
% example.
imwrite(outputImg,'2x2MajorityFilterImg.png')