I = imread("testImage.bmp");
% Setting up threshold values
T1 = uint8(190);
T2 = uint8(225);
T3 = uint8(150);
T4 = uint8(225);
T5 = uint8(20);
T6 = uint8(125);
BW = (I(:,:,1) >= T1 ) & (I(:,:,1) <= T2) & ...
    (I(:,:,2) >= T3 ) & (I(:,:,2) <= T4) & ...
    (I(:,:,3) >= T5 ) & (I(:,:,3) <= T6); % Comparaing RGB values of the image with the threshold values separately

img = I;

img(repmat(~BW,[1 1 3])) = 0; % Setting the values below and above the thresholds to 0

img = imbinarize(im2gray(img));

s = strel('disk',1,4); % 's' is strel of disk shape
img = imdilate(img, s);

outputImg = img;
[M,N] = size(img); % M and N stores the number of rows and columns of img
W = 4; % W is the window of size 4x4
step = floor(W/2);
for i = 1+step:M-step
    for j = 1+step: N-step
        window = img((i-step):(i+step), (j-step):(j+step));
        window = window(:);
        outputImg(i,j) = mode(window);
    end
end

ocrResults = ocr(outputImg, 'TextLayout', 'Block', 'CharacterSet', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789');
text = ocrResults.Text;
pattern = alphanumericsPattern(4) + " " + alphanumericsPattern(3); % Number plate have certain pattern and this represents that
plateNum = extract(text, pattern) % Extracting text that contains the pattern
finalImg = insertObjectAnnotation(double(outputImg), 'rectangle', ...
    ocrResults.WordBoundingBoxes, ...
    ocrResults.WordConfidences); % Annotating img with bounding boxes around the word with word confidences
imwrite(finalImg,'q6.png')
