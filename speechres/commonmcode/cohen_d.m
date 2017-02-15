function d = cohen_d(x, y)
mean_x = mean(x); 
mean_y = mean(y);

s = sqrt(((numel(x) - 1) * var(x) + (numel(y) - 1) * var(y)) / (numel(x) + numel(y)));

d = (mean(y) - mean(x)) / s;
return