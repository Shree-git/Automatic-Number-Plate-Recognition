img = imread("testImage.bmp");
[M,N,D] = size(img); % M, N, D are number of rows, columns and dimensions of img respectively
num_of_pixels = M*N;
Red = img(:,:,1);
Blue = img(:,:,3);
Green = img(:,:,2);

% Count Histogram
fig = figure;
x = [0:255];
y1 = imhist(Red);
y2 = imhist(Green);
y3 = imhist(Blue);
y=[y1 y2 y3];
b = bar(x,y,'grouped');
b(1).FaceColor = 'r';
b(2).FaceColor = 'g';
b(3).FaceColor = 'b';
axis square
hold on
plot(x,y1,'r',x,y2,'g',x,y3,'b')
hold off
xlabel('Luminance', 'FontSize', 14);
ylabel('Count','FontSize',14);
xlim([0 255]);
ylim([0 max([max(y1) max(y2) max(y3)])]);
set(gcf,'PaperPositionMode','auto')
print(fig,'CountHistogram','-dpng')

% Normalised Count Histogram
fig = figure;
x = [0:255];
y1 = imhist(Red);
y2 = imhist(Green);
y3 = imhist(Blue);
y1 = (y1/num_of_pixels);
y2 = (y2/num_of_pixels);
y3 = (y3/num_of_pixels);
y=[y1 y2 y3];
b = bar(x,y,'grouped');
b(1).FaceColor = 'r';
b(2).FaceColor = 'g';
b(3).FaceColor = 'b';
axis square
hold on
plot(x,y1,'r',x,y2,'g',x,y3,'b')
hold off
xlabel('Luminance', 'FontSize', 14);
ylabel('Normalized Count','FontSize',14);
xlim([0 255]);
ylim([0 max([max(y1) max(y2) max(y3)])]);
set(gcf,'PaperPositionMode','auto')
print(fig,'NormalisedCountHistogram','-dpng')

% Cumulative Count Histogram
fig = figure;
x = [0:255];
y1 = imhist(Red);
y2 = imhist(Green);
y3 = imhist(Blue);
for i = 2:256
    y1(i) = y1(i) + y1(i-1);
    y2(i) = y2(i) + y2(i-1);
    y3(i) = y3(i) + y3(i-1);
end
y=[y1 y2 y3];
b = bar(x,y,'grouped');
b(1).FaceColor = 'r';
b(2).FaceColor = 'g';
b(3).FaceColor = 'b';
axis square
hold on
plot(x,y1,'r',x,y2,'g',x,y3,'b')
hold off
xlabel('Luminance', 'FontSize', 14);
ylabel('Cumulative Count','FontSize',14);
xlim([0 255]);
ylim([0 num_of_pixels]);
set(gcf,'PaperPositionMode','auto')
print(fig,'CumulativeCountHistogram','-dpng')

% Normalised Cumulative Count Histogram
fig = figure;
x = [0:255];
y1 = imhist(Red);
y2 = imhist(Green);
y3 = imhist(Blue);
for i = 2:256
    y1(i) = y1(i) + y1(i-1);
    y2(i) = y2(i) + y2(i-1);
    y3(i) = y3(i) + y3(i-1);
end
y1 = (y1/num_of_pixels);
y2 = (y2/num_of_pixels);
y3 = (y3/num_of_pixels);
y=[y1 y2 y3];
b = bar(x,y,'grouped');
b(1).FaceColor = 'r';
b(2).FaceColor = 'g';
b(3).FaceColor = 'b';
axis square
hold on
plot(x,y1,'r',x,y2,'g',x,y3,'b')
hold off
xlabel('Luminance', 'FontSize', 14);
ylabel('Normalised Cumulative Count','FontSize',14);
xlim([0 255]);
ylim([0 1]);
set(gcf,'PaperPositionMode','auto')
print(fig,'NormalisedCumulativeCountHistogram','-dpng')