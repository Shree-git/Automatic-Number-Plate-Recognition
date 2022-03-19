img = imread("testImage.bmp");

imgGray = im2gray(img);

maximum = (max(max(double(imgGray)))) ;
minimum = (min(min(double(imgGray))));

Range = maximum - minimum
Normalized_Range = Range/(2^8-1)
Michelson_Contrast = Range/(maximum + minimum)

[M,N] = size(imgGray); % M and N are number of rows and columns of imgGray respectively

% RMS Contrast
summation = 0;
for i = 1:M
    for j = 1:N
        summation = summation + (double(imgGray(i,j)) - mean2(imgGray))^2;
    end
end
RMS_Contrast = sqrt((1/(M*N))*summation)

% Simple Arithmetic Mean
summation = 0;
for i = 1:M
    for j = 1:N
        summation = summation + double(imgGray(i,j));
    end
end
Simple_Arithmetic_Mean = (1/(M*N))*summation

% Harmonic Mean
summation = 0;
for i = 1:M
    for j = 1:N
        summation = summation + (1/double(imgGray(i,j)));
    end
end
Harmonic_Mean = (M*N)/summation

% Geometric Mean
summation = 0;
for i = 1:M
    for j = 1:N
        summation = summation + log(double(imgGray(i,j)));
    end
end
Geometric_Mean = exp((1/(M*N))*summation)

% Midrange
Midrange = double(maximum + minimum)/2

% 10% Winsorised Mean
imgGray = sort(imgGray(:));
sizeOfImgGray = numel(imgGray);
numOfTrimValues = 0.1 * sizeOfImgGray;
imgGray(1:numOfTrimValues) = imgGray(numOfTrimValues + 1);
imgGray(numOfTrimValues:end) = imgGray(end - numOfTrimValues - 1);
winsorisedMean = mean2(imgGray);

% 10% Trimmed Mean
imgGray = sort(imgGray(:));
sizeOfImgGray = numel(imgGray);
numOfTrimValues = 0.1 * sizeOfImgGray;
trimmedImgGray = imgGray(numOfTrimValues:end-numOfTrimValues);
trimmedMean = mean2(trimmedImgGray);
