head = ['*************                 *************']
head = ['*************                 *************']

%clear all;
%close all;

picsNo = 581;

%dataMatrix = zeros(picsNo, 4 * 64);
for imno = 548: picsNo
    i = imread(['c:\pics\jpg\a (', int2str(imno), ').jpg']);

    ['*  ' int2str(imno) '  *']

    t = Guide1(i, imno);
    dataMatrix(imno + 1,:) = t;


end;