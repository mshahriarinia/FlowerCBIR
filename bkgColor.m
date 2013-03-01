function ret = bkgColor( image )

imdata = rgb2hsv(image);

%hsv = rgb2hsv(image);
% ycc = rgb2ycbcr(image);
% figure, imshow(image), title('rgb');
% figure,imshow(hsv), title('hsv');
%figure,imshow(ycc), title('ycc');

sidePercentage = 0.07;

imRow =  size(imdata, 1);
imCol = size(imdata, 2);

bannerRow = round(sidePercentage * imRow);
bannerCol = round(sidePercentage * imCol);

% partNW = imdata(1:rowl, 1:coll, :);
% partNE = imdata(1:rowl, col - coll + 1:col, :);
% partSW = imdata(row - rowl + 1:row, 1:coll, :);
% partSE = imdata(row - rowl + 1:row, col - coll + 1:col, :);
%ret = [partNW partNE partSW partSE];

partL = imdata(:, 1:bannerCol, :);
% partT = imdata(1:bannerRow, :, :);
% partR = imdata(:, imCol - bannerCol + 1:imCol, :);
% partB = imdata(imRow - bannerRow + 1:imRow, :, :);


% figure, imshow(partL);
% figure, imshow(partR);
% figure, imshow(partT);
% figure, imshow(partB);


t = clusterdata(imdata(:,:,1),'maxclust',3);



ret = partL;


%       ============================  Note  ===============================

%perform k meanse to get the best colors of the border to be removed
%the colors that appear nmore than 20% of the background are to be removed


%grayscale torgb : RGB = cat(3,I,I,I);