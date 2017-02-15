function [p,m]=changePointTest(x,varargin)
% Siegel-Castellan change point test for continuous variables
% Input arguments
%   x: a one-dimensional series. 
% Output arguments
%   p: p-value from the z-test for large sample sizes
%   m: change point index
% 
% Reference: 
%   Siegel, S. and Castellan, N.J., Jr. (1988). Nonparametric Statistics
%   for the Behavioral Sciences. (2nd Edition). New York: McGraw-Hill. 
%   Section 4.6.3, pp. 67 - 70. 
% 
% Written by Shanqing Cai (cais@mit.edu). 09/19/2008. 

p=NaN; m=NaN;
if length(x)<10
    fprintf('series size too small to justify the normal-distruction assumption.\n')
    return
end

[sorted,idx]=sort(x);
N=length(x);
r=nan(1,N);
for i1=1:length(x)
    r(i1)=find(sorted==x(i1),1);
end

W=cumsum(r);
d=abs(2*W-(1:N)*(N+1));
[foo,m]=max(d);
W_max=W(m);
n=N-m;

if (W_max>m*(N+1)/2)
    h=-0.5;
elseif (W_max<m*(N+1)/2)
    h=0.5;
else
    fprintf('Unfortunate (and unlikely) tie between W_max and m*(N+1)/2! Refer to pp. 68 of Siegel & Castellan 1988!\n');   
end

z=(W_max+h-m*(N+1)/2)/sqrt(m*n*(N+1)/12);
p=1-normcdf(abs(z));
    
return