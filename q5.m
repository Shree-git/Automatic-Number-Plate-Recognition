img = imread("BinaryImage.png");

% Different strels
se1 = strel('disk',1,4);
se2 = strel('disk',2,4);
se3 = strel('square',3);
se4 = strel('square',6);
se5 = strel('line', 5, 45);
se6 = strel('diamond', 2);
se7 = strel('diamond', 3);

% Erode
imwrite(imerode(img,se1), 'Erode-disk1_4.png')
imwrite(imerode(img,se2), 'Erode-disk2_4.png')
imwrite(imerode(img,se3), 'Erode-square3.png')
imwrite(imerode(img,se4), 'Erode-square6.png')
imwrite(imerode(img,se5), 'Erode-line5_45.png')
imwrite(imerode(img,se6), 'Erode-diamond2.png')
imwrite(imerode(img,se6), 'Erode-diamond3.png')

% This is just one example. I did it for all the 28 total images to get the data.
erodeImg1 = imread('Erode-disk1_4.png');
numOfPixelsSelected = 0;
for i=1:numel(erodeImg1)
    numOfPixelsSelected = numOfPixelsSelected + erodeImg1(i);
end

numOfPixelsSelected

DisconnectedClusters = bwconncomp(erodeImg1);
numOfDisconnectedClusters = DisconnectedClusters.NumObjects

% Dilate
imwrite(imdilate(img,se1), 'Dilate-disk1_4.png')
imwrite(imdilate(img,se2), 'Dilate-disk2_4.png')
imwrite(imdilate(img,se3), 'Dilate-square3.png')
imwrite(imdilate(img,se4), 'Dilate-square6.png')
imwrite(imdilate(img,se5), 'Dilate-line5_45.png')
imwrite(imdilate(img,se6), 'Dilate-diamond2.png')
imwrite(imdilate(img,se6), 'Dilate-diamond3.png')

% Open
imwrite(imopen(img,se1), 'Open-disk1_4.png')
imwrite(imopen(img,se2), 'Open-disk2_4.png')
imwrite(imopen(img,se3), 'Open-square3.png')
imwrite(imopen(img,se4), 'Open-square6.png')
imwrite(imopen(img,se5), 'Open-line5_45.png')
imwrite(imopen(img,se6), 'Open-diamond2.png')
imwrite(imopen(img,se6), 'Open-diamond3.png')

% Close
imwrite(imclose(img,se1), 'Close-disk1_4.png')
imwrite(imclose(img,se2), 'Close-disk2_4.png')
imwrite(imclose(img,se3), 'Close-square3.png')
imwrite(imclose(img,se4), 'Close-square6.png')
imwrite(imclose(img,se5), 'Close-line5_45.png')
imwrite(imclose(img,se6), 'Close-diamond2.png')
imwrite(imclose(img,se6), 'Close-diamond3.png')

