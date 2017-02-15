% plot_sd_2: Show mean +/- 1 SD plots in 2D with patches
% 
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2010-03-28

function plot_sd_2(af1, af2, sdf1, colr, varargin)
% Assume ascending af2.
    if isempty(findStringInCell(varargin,'patch'))
        for n = 1 : length(af2) - 1
            if (sdf1(n+1)+af1(n+1)>af1(n)-sdf1(n))
                rectangle('Position', [af1(n)-sdf1(n), af2(n),sdf1(n+1)+af1(n+1)-(af1(n)-sdf1(n)), (af2(n+1)-af2(n))*1.05],...
                    'FaceColor', colr, 'EdgeColor', 'none');
            else
                rectangle('Position', [sdf1(n+1)+af1(n+1),af2(n),(af1(n)-sdf1(n))-(sdf1(n+1)+af1(n+1)),(af2(n+1)-af2(n))*1.05],...
                    'FaceColor', colr, 'EdgeColor', 'none');
            end
            hold on;
        end
    else
        for n = 1 : length(af2) - 1
%             if (sdf1(n+1)+af1(n+1)>af1(n)-sdf1(n))
                patch([af1(n)-sdf1(n),af1(n)+sdf1(n),af1(n)+sdf1(n),af1(n)-sdf1(n)],...
                    [af2(n),af2(n),af2(n+1),af2(n+1)],colr,'FaceAlpha',0.5,'EdgeColor','none');
%                 patch([af1(n)-sdf1(n), af2(n),sdf1(n+1)+af1(n+1)-(af1(n)-sdf1(n)), (af2(n+1)-af2(n))*1.05],...
%                     colr, 'EdgeColor', 'none');
%                 patch
%             else
%                 rectangle('Position', [sdf1(n+1)+af1(n+1),af2(n),(af1(n)-sdf1(n))-(sdf1(n+1)+af1(n+1)),(af2(n+1)-af2(n))*1.05],...
%                     colr, 'EdgeColor', 'none');
%             end
            hold on;
        end
    end
return
