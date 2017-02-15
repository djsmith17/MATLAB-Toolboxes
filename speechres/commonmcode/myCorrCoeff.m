% myCorrCoeff - correlation coefficient between two 1-D arrays
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date 2009-01-19

function r=myCorrCoeff(x,y)
n=length(x);
r=(n*sum(x.*y)-sum(x)*sum(y))/sqrt(n*sum(x.^2)-sum(x)^2)/sqrt(n*sum(y.^2)-sum(y)^2);
return
