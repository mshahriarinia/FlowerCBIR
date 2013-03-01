
close all;

for imno = 1: 1
    i = imread(['c:\pics\', int2str(imno), '.jpg']);

    ih = imhist(i(:,:,1), 70    );
    
    
    figure, edge(rgb2gray(i), 'prewitt');
end

