function eqlims(varargin)
xs = get(gca, 'XLim');
ys = get(gca, 'YLim');
lims = [min([xs(1), ys(1)]), max([xs(2), ys(2)])];

if ~isempty(fsic(varargin, 'line'))
    plot(lims, lims, '-', 'Color', [0.5, 0.5, 0.5]);
end

if ~isempty(fsic(varargin, 'grid'))
    grid on;
end

set(gca, 'XLim', lims, 'YLim', lims);
axis square;
return