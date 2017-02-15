% fdr: FDR correction 
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)

function p_thresh=fdr(ps,q)
% p_thresh=fdr(ps,q)
%   ps: vector of p-values
%   q: False-Discovery Rate (FDR), e.g., 0.05
%   p_thresh: corrected p-value threshold
%%
ps = ps(~isnan(ps));

[ps_sorted,idx_sort]=sort(ps);

np=length(ps);
c=0;

for i1=1:np
    c=c+1/i1;
end
c=1;

for i1=length(ps_sorted):-1:1
    if (ps_sorted(i1)<=i1/np*q/c)
        break;
    end
end
p_thresh=ps_sorted(i1);

fprintf('%s: Threshold of p-value = %.8f\n',mfilename,p_thresh);

return
