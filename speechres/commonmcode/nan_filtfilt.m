function y = nan_filtfilt(b, a, x)
idx_nan = find(isnan(x));

tAxis = 1:length(x);
tAxis = tAxis(~isnan(x));
xInterp = x(~isnan(x));
x(idx_nan) = interp1(tAxis,xInterp,idx_nan);
y = filtfilt(b, a, x);

y(idx_nan) = NaN;
return