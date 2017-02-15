% cmc_FDR: perform FDR-type correction for multiple comparisons on an input MRI image file and write results to an ouptut image file
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)

function cmc_FDR(imIn,imOut,q)
%% Read in input image
im_in=MRIread(imIn);
%%
logp_signed=im_in.vol(:);
idx_nz=find(logp_signed>0);
logp_signed_nz=logp_signed(idx_nz);
pvals=10.^(-abs(logp_signed_nz));
[pvals_sorted,idx_sort]=sort(pvals);

nVox=length(pvals);
c=0;

for i1=1:nVox
    c=c+1/i1;
end
c=1;

for i1=length(pvals_sorted):-1:1
    if (pvals_sorted(i1)<=i1/nVox*q/c)
        break;
    end
end
fprintf('%s: Threshold of p-value = %.6f\n',mfilename,pvals_sorted(i1));

logp_thresh=-log10(pvals_sorted(i1));

new_vol=im_in.vol;
new_vol(abs(new_vol)<logp_thresh)=0;

im_out=im_in;
im_out.vol=new_vol;

MRIwrite(im_out,imOut);

return
