function cplims(fDest, fOrig)
set(0, 'CurrentFigure', fOrig);
xs = get(gca, 'XLim');
ys = get(gca, 'YLim');

set(0, 'CurrentFigure', fDest);
set(gca, 'XLim', xs, 'YLim', ys);
return
