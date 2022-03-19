function [plateNum, finalFrame] = detectPlateNumber(frame)
I = frame;
T1 = uint8(140);
T2 = uint8(255);
T3 = uint8(110);
T4 = uint8(255);
T5 = uint8(0);
T6 = uint8(100);
sliderBW = (I(:,:,1) >= T1 ) & (I(:,:,1) <= T2) & ...
    (I(:,:,2) >= T3 ) & (I(:,:,2) <= T4) & ...
    (I(:,:,3) >= T5 ) & (I(:,:,3) <= T6);
BW = sliderBW;

imgs = I;

imgs(repmat(~BW,[1 1 3])) = 0;

imgs = imbinarize(im2gray(imgs));

se7 = strel('disk',1,4);
imgs = imdilate(imgs, se7);

outputImg = imgs;
[M,N] = size(imgs);
W = 2;
step = floor(W/2);
for i = 1+step:M-step
    for j = 1+step: N-step
        window = imgs((i-step):(i+step), (j-step):(j+step));
        window = window(:);
        outputImg(i,j) = mode(window);
    end
end

roi = [68 344 945 1113];
ocrResults = ocr(outputImg, roi, 'TextLayout', 'Block', 'CharacterSet', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789');
text = ocrResults.Text;
plateNum = text;
if (~isempty(ocrResults.WordBoundingBoxes) | ~isempty(ocrResults.WordConfidences))
    finalFrame = insertObjectAnnotation(double(outputImg), 'rectangle', ...
        ocrResults.WordBoundingBoxes, ...
        ocrResults.WordConfidences);
else
    finalFrame = double(outputImg);
end
end