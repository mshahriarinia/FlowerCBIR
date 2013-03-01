for imno = 0: picsNo
    i = imread(['c:\pics\final\a (', int2str(imno), ').jpg']);
   
    imwrite(i, ['c:\pics\finalClustered\a', int2str(clust(imno + 1)), '\a (', int2str(imno), ').jpg']);
    
end