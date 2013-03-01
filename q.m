head = ['*************                 *************']
head = ['*************                 *************']

clear all;
close all;

picsNo = 2;

histCount = 150;

mp = Guide1(imread('c:\pics\5.jpg'));% Main Pic

hRMP = imhist(mp(:,:,1), histCount);
hGMP = imhist(mp(:,:,2), histCount);
hBMP = imhist(mp(:,:,3), histCount);

[x y] = size(mp);

threshR = 5 * x * y;
threshG = 5 * x * y;
threshB = 5 * x * y;

dataMatrix = zeros(3 * picsNo, histCount);
for imno = 1: picsNo
    i = imread(['c:\pics\', int2str(imno), '.jpg']);

    head = ['*************         ' int2str(imno) '        *************']

    figure, imshow(i);

    o = Guide1(i);

    hR = imhist(o(:,:,1), histCount);
    hG = imhist(o(:,:,2), histCount);
    hB = imhist(o(:,:,3), histCount);

    difR = abs(hR - hRMP);
    difG = abs(hG - hGMP);
    difB = abs(hB - hBMP);

    sumR = sum(sum(difR));
    sumG = sum(sum(difG));
    sumB = sum(sum(difB));

    if sumR < threshR && sumG < threshG && sumB < threshB

        figure, imshow(o);

        imwrite(o,['c:\pics\temp\', int2str(imno), '.jpg']);

        tail= ['*************         ' int2str(imno) '        *************']
    end
    %imshow(bkgColor(i));
    %bkgColor(i);

end;
