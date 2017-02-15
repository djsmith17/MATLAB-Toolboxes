function draw_xy_axes
xs = get(gca, 'XLim');
ys = get(gca, 'YLim'); 

hold on;
plot(xs, repmat(ys(1) + 0.001 * range(ys), 1, 2), 'k-');
plot(repmat(xs(1) + 0.001 * range(xs), 1, 2), ys, 'k-');
return