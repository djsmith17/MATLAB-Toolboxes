function varargout = quickText1(str, fs)
    xs = get(gca, 'XLim');  ys = get(gca, 'YLim');
    text(xs(1) + 0.03 * range(xs), ys(2) - 0.075 * range(ys), str, 'FontSize', fs);
return