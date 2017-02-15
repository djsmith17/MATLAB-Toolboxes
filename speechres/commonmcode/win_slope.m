function slp = win_slope(x, wn, varargin)
% win_slope - Calculate the slope in a moving rectangular window of given width
% 
% Inputs
% x - input signal
% wn - window size (# of samples)
% varargin{1} - t0 - sampling duration (1 / sampling rate)
%
% Author: Shanqingn Cai (shanqing.cai@gmail.com)
% Date: 2012-10-19


if nargin == 3
    t0 = varargin{1};
else
    t0 = NaN;
end

n = length(x);
slp = nan(1, n);

% for i1 = 1 : n - wn + 1
 for i1 = wn : n
    x1 = x(i1 - wn + 1 : i1);
    
    v = (0 : wn - 1)';
    b = regress(x1, [ones(size(x1)), v]);
    
    if ~isnan(t0)
        slp(i1) = b(2) / t0;
    else
        slp(i1) = b(2);
    end
    
end

return
