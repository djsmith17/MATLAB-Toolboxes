% Convert cell array to numerical array
% Author: Shanqing Cai (shanqing.ca@gmail.com)

function [na,u]=cell2NumArray(c)
u=unique(c);
na=nan(size(c));
for n=1:length(c)
    na(n)=findStringInCell(u,c{n});
end
return
