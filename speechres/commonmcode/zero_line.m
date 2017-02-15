function zero_line(varargin)
% zero_line - Draw a horizonal line at y coordinate of zero in a plot
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2012-10-15

yval = 0;
if nargin == 1
    yval = varargin{1};
end

hold on;
xs = get(gca, 'XLim');
plot(xs, [yval, yval], '-', 'Color', [0.5, 0.5, 0.5]);
set(gca, 'XLim', xs);
return
