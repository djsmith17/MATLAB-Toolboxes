% resize_figure: change the size of a figure to [w, h] (width, height)
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2011-11-01

function resize_figure(w, h)
if w > 0 && h > 0
    pos = get(gcf, 'Position');
    set(gcf, 'Position', [pos(1), pos(2), w, h]);
    fprintf('W: %f --> %f\n', pos(3), w);
    fprintf('H: %f --> %f\n', pos(4), h);
else
    error('Input argument error.')
end
end
