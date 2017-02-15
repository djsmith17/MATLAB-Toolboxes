% mva_nz - perform mva (see mva.m) moving average on non-zero parts of an input 1-D signal
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2010-10-24

function [output,k_starts,k_ends]=mva_nz(input,width,varargin)
% Moving-window average applied to only the non-zero segments of an
% 1-dimensional array

% idx_nz=find(input~=0);
% 
% k_end=find(diff(idx_nz)>1);
k_starts=[];
k_ends=[];
stat=0;

for i1=1:length(input)
    if stat==0
        if input(i1)~=0
            k_starts=[k_starts,i1];
            stat=1;
        end
    elseif stat==1
        if input(i1)==0
            k_ends=[k_ends,i1-1];
            stat=0;
        end
    end
end
if (stat==1)
    k_ends=[k_ends,length(input)];
end

output=input;
for i1=1:length(k_starts)
    output(k_starts(i1):k_ends(i1))=mva(input(k_starts(i1):k_ends(i1)),width,varargin{1});
end

return
