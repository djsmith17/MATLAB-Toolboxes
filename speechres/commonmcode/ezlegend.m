function ezlegend(boxpos, xdiv, names, fcs, fss, lts, lcs, lws, bwe, varargin)
% 
% ezlegend(boxpos,xdiv,names,fcs,fss,lts,lcs,lws,bwe,varargin)
%
% Usage example: 
% ezlegend([0.1,0.75,0.3,0.2],0.45,{'Item 1','Item 2','Item 3'},{'r','g','b'},...
%     [12,12,12],{'-','--','.-'},{'r','g','b'},[3,2,1],[0,0,0]);
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)

%%
nItems=numel(names);

if length(boxpos) == 5 && isnan(boxpos(1))
    xs = get(gca, 'XLim'); 
    ys = get(gca, 'YLim');
    
    o_boxpos = boxpos(2 : 5);
    boxpos = nan(1, 4);
    boxpos(1) = xs(1) + range(xs) * o_boxpos(1);
    boxpos(2) = ys(1) + range(ys) * o_boxpos(2);
    boxpos(3) = range(xs) * o_boxpos(3);
    boxpos(4) = range(ys) * o_boxpos(4);
%     boxpos(3) = 0.01;
%     boxpos(4) = 0.01;
end

hold on;
rectangle('Position', boxpos, 'FaceColor', 'none');

line_y=boxpos(2)+boxpos(4)-(boxpos(4)/(nItems+1))*[1:nItems];
y_space=boxpos(4)/(nItems+1);
line_x1=boxpos(1)+xdiv/9*boxpos(3);
line_x2=boxpos(1)+xdiv/9*8*boxpos(3);
text_x=boxpos(1)+xdiv*boxpos(3);

for i1=1:numel(nItems)
    for i1=1:nItems
        if bwe(i1) == 0
            if isequal(lts{i1},'-o-')
                plot([line_x1,line_x2],[line_y(i1),line_y(i1)],'-',...
                    'color',lcs{i1},'LineWidth',lws(i1));
                plot(mean([line_x1,line_x2]),mean([line_y(i1),line_y(i1)]),'o',...
                    'color',lcs{i1},'LineWidth',lws(i1));
            else
                if isequal(lts{i1}, '.')
                    line_xs = linspace(line_x1, line_x2, 9);
                    line_ys = repmat(line_y(i1), 1, 9);
                else
                    line_xs = [line_x1,line_x2];
                    line_ys = [line_y(i1),line_y(i1)];
                end
                
                plot(line_xs, line_ys, lts{i1},...
                    'color',lcs{i1},'LineWidth',lws(i1));            
            end
            hold on;
        elseif bwe(i1) == 1 % Dashed lines as SEM 
            if isequal(lts{i1}, '.')
                line_xs = linspace(line_x1, line_x2, 9);
                line_ys = repmat(line_y(i1), 1, 9);
            else
                line_xs = [line_x1,line_x2];
                line_ys = [line_y(i1),line_y(i1)];
            end
            
            plot(line_xs,line_ys,lts{i1},...
                'color',lcs{i1},'LineWidth', lws(i1));
            hold on;
            plot(line_xs,line_ys+y_space*0.2,'--',...
                'color',lcs{i1},'LineWidth', bwe(i1));
            plot(line_xs,line_ys-y_space*0.2,'--',...
                'color',lcs{i1},'LineWidth', bwe(i1));
        elseif bwe(i1) == 2 % Patch (plot_sd_t)
            line_xs = [line_x1,line_x2];
            line_ys = [line_y(i1),line_y(i1)];
            plot_sd_t(line_xs, line_ys, y_space * 0.15, lcs{i1}, 'patch', 'FaceAlpha', 0.3);
            plot(line_xs,line_ys,lts{i1},...
                'color',lcs{i1},'LineWidth',lws(i1));
        end
        
        text(text_x,line_y(i1),names{i1},'color',fcs{i1},'FontSize',fss(i1));
    end
end

return
