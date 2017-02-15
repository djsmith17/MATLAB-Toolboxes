% mi_tab - Compute the mutual information from a 2-D count table 
% 
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2012-07-09

function mi = mi_tab(tab)
eps = 1e-12;


tab_x = repmat(sum(tab), size(tab, 1), 1);
tab_y = repmat(sum(tab')', 1, size(tab, 2));

tab_eps = tab;
tab_eps(tab_eps == 0) = eps;
tab_x_eps = tab_x;
tab_x_eps(tab_x_eps == 0) = eps;
tab_y_eps = tab_y;
tab_y_eps(tab_y_eps == 0) = eps;

mi = sum(sum(tab .* log(tab_eps ./ tab_x_eps ./ tab_y_eps)));
return
