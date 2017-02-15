% get_cont_stretches: get continuous intervals (stretches) of ones in a 1-D array of zeros and ones
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)

function [t_onset, t_offset] = get_cont_stretches(x)
t_onset = [];
t_offset = [];

stat = 0;

for i1 = 1 : numel(x)
    if stat == 0
        if x(i1) == 1
            t_onset(end + 1) = i1;
            stat = 1;
        end
    else
        if x(i1) == 0
            t_offset(end + 1) = i1 - 1;
            stat = 0;
        end
    end
end

if length(t_onset) > length(t_offset)
    t_offset(end + 1) = length(x);
end


return
