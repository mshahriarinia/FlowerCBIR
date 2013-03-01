
meanOfClusters = zeros(58,256);
countOfClusters = zeros(58,1);
for idx = 1:582

    for idxClusters = 1: 58
      
        if (clust(idx) == idxClusters)
              countOfClusters(idxClusters) = countOfClusters(idxClusters) + 1;
            meanOfClusters(idxClusters,:)  = (meanOfClusters(idxClusters,:) + dataMatrix(idx, :));

        end

    end

end

for idxClusters = 1: 58

    meanOfClusters(idxClusters,:) = meanOfClusters(idxClusters,:)  / countOfClusters(idxClusters);

end