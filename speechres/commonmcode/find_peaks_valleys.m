% find_peaks_valleys: Find local maxima and minima
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)

function [nPeaks,nValleys]=find_peaks_valleys(x)
dx=diff(x);
nPeaks=find(dx(1:end-1)>0 & dx(2:end)<=0)+1;
nValleys=find(dx(1:end-1)<0 & dx(2:end)>=0)+1;
return
