% plot_sd_t: 
% 
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2011-01-09

function plot_sd_t(t, af, sdf, colr, varargin)
if isempty(fsic(varargin,'FaceAlpha'))
    faceAlpha=0.75;
else
    faceAlpha=varargin{fsic(varargin,'FaceAlpha')+1};
end

% Assume ascending af2.
    if isempty(findStringInCell(varargin,'patch'))
        for n = 1 : length(t) - 1
            if sdf(n)>0
                rectangle('Position', [t(n), af(n)-sdf(n), t(n+1)-t(n), 2*sdf(n)],...
                        'FaceColor', colr, 'EdgeColor', 'none');
            end
            hold on;
        end
    else
        for n = 1 : length(t) - 1
            patch([t(n),t(n+1),t(n+1),t(n)],[af(n)-sdf(n),af(n)-sdf(n),af(n)+sdf(n),af(n)+sdf(n)],...
                colr,'FaceAlpha',faceAlpha,'EdgeColor','none');
            hold on;
        end
    end
return
