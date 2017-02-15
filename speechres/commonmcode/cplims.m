% cplims: Copy the xlims and ylims from one figure to another
% Author: Shanqing Cai (shanqing.cai@gmail.com)

function cplims(fDest, fOrig)
set(0, 'CurrentFigure', fOrig);
xs = get(gca, 'XLim');
ys = get(gca, 'YLim');

set(0, 'CurrentFigure', fDest);
set(gca, 'XLim', xs, 'YLim', ys);
return
