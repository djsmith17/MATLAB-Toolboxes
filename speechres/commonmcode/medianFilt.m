% medianFilt: median filter, 1-D
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2008-04-01

function y=medianFilt(x,k)
y=zeros(size(x));

h=floor(k/2);
for n=1:length(x)
    y(n)=median(x(max(n-h,1):min(n+h,length(x))));
end

return
