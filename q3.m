
% Exported 'BW' which is the binary image into the workspace using the
% colorThresholder
colorThresholder(img);

% Wrote BW image in the file BinaryImage.png which is included in the
% folder
imwrite(BW,'BinaryImage.png')

I = imread("testImage.bmp"); % I is the test image
T1 = uint8(215);
T2 = uint8(225);
T3 = uint8(175);
T4 = uint8(225);
T5 = uint8(20);
T6 = uint8(125);
BW = (I(:,:,1) >= T1 ) & (I(:,:,1) <= T2) & ...
    (I(:,:,2) >= T3 ) & (I(:,:,2) <= T4) & ...
    (I(:,:,3) >= T5 ) & (I(:,:,3) <= T6); % Comparaing RGB values of the image with the threshold values separately

img = I;

img(repmat(~BW,[1 1 3])) = 0; % Setting the values below and above the thresholds to 0

numOfPixelsSelected = 0;
for i=1:numel(BW)
    numOfPixelsSelected = numOfPixelsSelected + BW(i);
end

numOfPixelsSelected

DisconnectedClusters = bwconncomp(BW);
numOfDisconnectedClusters = DisconnectedClusters.NumObjects

HadamardImg = I.*uint8(BW);

imwrite(HadamardImg,'HadamardImg.png')