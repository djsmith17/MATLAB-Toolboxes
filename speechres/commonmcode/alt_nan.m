function y = alt_nan(x0, x, nSegs)
dist = cumsum(sqrt(diff(x0).^2 + diff(x).^2));
dist = [dist,dist(end)];
dist = dist/max(dist);

x1 = linspace(0,1,numel(x));
y1 = sin(2*pi*nSegs*x1);
% y1 = interp1(x1,y1,dist);

y = x;
y(y1<0) = NaN;

return

