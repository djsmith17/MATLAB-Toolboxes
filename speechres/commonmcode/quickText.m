function varargout = quickText(hdl, str, fs)
    xs = xlim;  
    ys = ylim;
    text(hdl, xs(1) + 0.05 * range(xs), ys(1) + 0.05 * range(ys), str, 'FontSize', fs);
return