% inc_radix: radix increment by 1.
% Inputs: x0 - input array, most most significant to least significant digit
%         r  - radix (e.g., 2)
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2012-12-23

function x1 = inc_radix(x0, r)
x1 = x0;
x1(end) = x1(end) + 1;

for i1 = length(x1) : -1 : 2
    if x1(i1) == r
        x1(i1) = 0;
        x1(i1 - 1) = x1(i1 - 1) + 1;
    end
end

if x1(1) == r
    x1 = zeros(size(x0));
end
return
