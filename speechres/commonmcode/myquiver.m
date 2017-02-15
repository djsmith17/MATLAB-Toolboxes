% myquiver - quiver plot 
% Inputs, x, y - origins of the quivers
%         vx, vy - quiver vectors
%
% Author - Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2010-03-26

function varargout=myquiver(x,y,vx,vy,varargin)
    sz=10;
    if (isempty(findStringInCell(varargin,'color')))
        quiverColor=[0.5,0.5,0.5];
    else
        quiverColor=varargin{findStringInCell(varargin,'color')+1};
    end
    if (isempty(findStringInCell(varargin,'lw')))        
        lw=1.5;
    else
        lw=varargin{findStringInCell(varargin,'lw')+1};
    end
    
    arrowLen=10;
    if ~isempty(fsic(varargin,'arrowLen'))
        arrowLen=varargin{fsic(varargin,'arrowLen')+1};
    end
    arrowWidth=1;
    if ~isempty(fsic(varargin,'arrowWidth'))
        arrowWidth=varargin{fsic(varargin,'arrowWidth')+1};
    end    
    
    for n=1:length(x)
        if sqrt(vx(n)^2 + vy(n)^2)>10
            arrow([x(n),y(n)],[x(n)+vx(n),y(n)+vy(n)],'FaceColor',quiverColor,'EdgeColor',quiverColor,'Length',arrowLen,'Width',arrowWidth);
        end
    end
return
