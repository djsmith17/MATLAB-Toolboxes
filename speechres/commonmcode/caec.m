% caec: Close all figures except the current figure
% Author: Shanqing Cai (shanqing.cai@gmail.com)

fns = findobj('Type', 'figure');
cfn = gcf;

if ~isempty(fns)
    for i1 = 1 : numel(fns)
        if fns(i1) ~= cfn
            close(fns(i1));
        end
    end
end
