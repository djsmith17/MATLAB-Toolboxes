% getNonZeroChunks: get beginning and ending indices of nonzero intervals in a 1-D array
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2010-04-13

function [idxBegin,idxEnd]=getNonZeroChunks(x)
stat=0;
% if x(1)~=0
%     stat=1;
% end

idxBegin=[];
idxEnd=[];

for i1=1:length(x)
    if stat==0
        if x(i1)>0
            idxBegin(end+1)=i1;
            stat=1;
        end
    else
        if x(i1)==0
            idxEnd(end+1)=i1-1;
            stat=0;
        end
    end
end

if stat==1
    idxEnd(end+1)=i1;
end
return
