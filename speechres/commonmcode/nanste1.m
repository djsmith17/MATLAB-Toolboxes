function se = nanste1(x)
idx = find(~isnan(sum(x, 2)));
x1 = x(idx, :);
se = std(x1, 1) / sqrt(length(idx));
return