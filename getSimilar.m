function sims = getSimilar( pics )

close all

load dataMatrix3;
load meanOfClusters;
load countOfClusters;
load clust1_58;

[lenY lenX] = size(pics);

means = zeros(1,256);



for idxPics = 1: lenX
    i = uint16(round(pics(idxPics)));
    temp = dataMatrix(i,:);
    means  = means + temp;

end


for idx = 1: 256
     means(idx) = means(idx) / lenX;
 end

% for idx = 1: 58
%     means(idx) = means(idx) / lenX;
% end

diff = zeros(58,256);

for idx = 1 : 58

    diff(idx,:) = meanOfClusters(idx,:) - means;
end

diffOne = zeros(58);

for idx = 1 : 58

    for idxFeats = 1 : 256
        if diff(idx, idxFeats) >= 0
            diffOne(idx) = diffOne(idx) + diff(idx,idxFeats);
        else
            diffOne(idx) = diffOne(idx) - diff(idx,idxFeats);
        end


    end

end

min1 = diffOne(1);
minIdx1 = 1;
for idx = 1: 58

    if min1 > diffOne(idx)
        min1 = diffOne(idx);
        minIdx1 = idx;
    end

end

min2 = diffOne(1);
minIdx2 = 1;
for idx = 1: 58

    if min2 > diffOne(idx) && minIdx1 ~= idx
        min2 = diffOne(idx);
        minIdx2 = idx;
    end

end


% get the pics of the closest clusters. grade them

i1 = uint16(round(minIdx1));
i2 = uint16(round(minIdx2));

sumSizes = countOfClusters(i1) + countOfClusters(i2);

gradingImages = zeros(sumSizes,2);
% first for im No and sec for amount of similarity, it will be sorted at
% last

gradingImagesIdx = 1;
for idx = 1: 582

    if clust(idx) == minIdx1

        gradingImages(gradingImagesIdx,1) = idx;
        gradingImagesIdx = gradingImagesIdx + 1;

        %get the difference of each and sort

    end

end

for idx = 1: 582%then add the second cluster images

    if clust(idx) == minIdx2

        gradingImages(gradingImagesIdx,1) = idx;
        gradingImagesIdx = gradingImagesIdx + 1;

        %get the difference of each and sort

    end

end


%display

for idx = 1 : lenX
    
    subplot(2,2,idx);
     imshow(['c:\pics\final\a (', int2str(pics(idx)), ').jpg']);
     title(int2str(pics(idx)));


end



%sort grading images based on data matrix
%assign the second column of grading images to the difference to the 
for idx = 1 : sumSizes
    tempDiff = dataMatrix(gradingImages(idx, 1),:) - means;

    tempSum = 0;
    for idxI = 1: 256

        if tempDiff(idxI) < 0
                       tempDiff(idxI) = - tempDiff(idxI);
        end
            tempSum = tempSum + tempDiff(idxI);        
    end

   gradingImages(idx, 2) = tempSum;
    
end

%sort 
for idx1 = 1: sumSizes
    
   for idx2 = 1: sumSizes
       
      if gradingImages(idx1, 2) < gradingImages(idx2, 2)
          
         temp = gradingImages(idx1, :);
         gradingImages(idx1, :) = gradingImages(idx2, :);
         gradingImages(idx2, :) = temp;
          
      end
       
   end
    
end

figure
for idx = 1 : 25
    
    subplot(5,5,idx);
     imshow(['c:\pics\final\a (', int2str(gradingImages(idx)), ').jpg']);
     title(int2str(gradingImages(idx) + 1));


end

sims= [minIdx1 minIdx2];



