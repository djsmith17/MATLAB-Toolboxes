% intersect_cells: Find the intersect of two cell arrays 
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2013-02-10

function xx = intersect_cells(x1, x2)
n1 = length(x1);
n2 = length(x2);

xx = {};

for i1 = 1 : n1
    for i2 = 1 : n2
        if isequal(x1{i1}, x2{i2})
            xx{end + 1} = x1{i1};
            break;
        end
    end
end

return
