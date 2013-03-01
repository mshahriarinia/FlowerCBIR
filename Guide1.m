%function output = Guide1( i, imno )
function output = Guide1( i )


%i = imread('c:\pics\7.jpg');

%i2 = imadjust(i,[.2 .3 0; .6 .7 1],[]);

i = imresize(i, [100 100]);

imdata = rgb2hsv(i);

%H = fspecial('unsharp');
%sharpened = imfilter(imdata,H,'replicate');
%imshow(sharpened); title('Sharpened Image');
%imdata = sharpened;



%figure,imshow(imdata)
%figure,imshow(imdata(:,:,1));
R=imdata(:,:,1);
G=imdata(:,:,2);
B=imdata(:,:,3);
X=[R(:) G(:) B(:)]  ;
[IDX ,C] = kmeans(X,4, 'start', 'cluster');
%C
%corrcoef(X)
D = reshape(IDX,size(R));
%imagesc (D); figure(gcf)
%clc
L1 = D == 1  ;
%imagesc (L1); figure(gcf)
L1 = bwfill(L1 ,'holes');
%imagesc (L1); figure(gcf)
L2 = imclearborder(L1) ;
%imagesc (L2); figure(gcf)
nC1 = sum(sum(L1==1 & L2==0));
%%%%%nC1
L1 = D == 2  ;
%imagesc (L1); figure(gcf)
L1 = bwfill(L1 ,'holes');
%imagesc (L1); figure(gcf)
L2 = imclearborder(L1) ;
%imagesc (L2); figure(gcf)
nC2 = sum(sum(L1==1 & L2==0));
%nC2
L1= D ==3 ;
%imagesc (L1); figure(gcf)
L1 = bwfill(L1 ,'holes');
%imagesc (L1); figure(gcf)
L2 = imclearborder(L1) ;
nC3 = sum(sum(L1==1 & L2==0));
%nC3
L1= D ==4 ;
%imagesc (L1); figure(gcf)
L1 = bwfill(L1 ,'holes');
L2 = imclearborder(L1) ;
nC4 = sum(sum(L1==1 & L2==0));
%nC4
%imagesc (L1); figure(gcf)

%bkgThresh = 500;
[xL, yL] = size(D);
%bkgThresh = 0.08 * xL * yL; % a
% bkgThresh = 0.33 * xL * yL;    --> worst not saved
%bkgThresh = 0.12 * xL * yL; % b
bkgThresh = 0.11 * xL * yL; % c

B = D == 555; %B will be all false
nMin = nC1;
indexMin = 1;
if(nC1 > bkgThresh)
    B = D ==1 | B;
end

if(nC2 > bkgThresh)
    B = D ==2 | B;
    if nC2 < nMin
        nMin = nC2;
        indexMin = 2;
    end
end

if(nC3 > bkgThresh)
    B = D ==3 | B;
    if nC2 < nMin
        nMin = nC2;
        indexMin = 3;
    end

end

if(nC4 > bkgThresh)
    B = D ==4 | B;
    if nC2 < nMin
        nMin = nC2;
        indexMin = 4;
    end
end

if sum(sum(L1==1 & L2==0)) == 0 % incase of empty add the least
    B = D ==indexMin;
end


%B = D ==1| D == 2 |D==3 ;
%F = D==4 ;
%imagesc (F); figure(gcf)
%imagesc (B); figure(gcf)

temp = i;

sizeX = size(i,1);
sizeY = size(i,2);

for x = 1:sizeX
    for y = 1: sizeY
        if B(x,y)== 1
            temp(x,y,:)=0;
       
        end
    end
end

output = temp;

%imwrite(output, ['c:\pics\final\a (', int2str(imno), ').jpg']);

% feature extraction

imhI = imhist(rgb2gray(output), 64);
imhR = imhist(output(:,:,1), 64);
imhG = imhist(output(:,:,2), 64);
imhB = imhist(output(:,:,3), 64);

imhI(1) = 0;
imhR(1) = 0;
imhG(1) = 0;
imhB(1) = 0;

imhI = imhI.';
imhR = imhR.';
imhG = imhG.';
imhB = imhB.';


%featV = [max(imhI) max(imhR) max(imhG) max(imhB)];
featV = [imhI imhR imhG imhB];


output = featV;


%close all;
%figure, imshow(i);
%figure, imshow(temp);
