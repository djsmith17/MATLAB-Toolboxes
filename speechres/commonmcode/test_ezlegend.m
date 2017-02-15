function test_ezlegend
figure;
set(gca,'XLim',[0,1],'YLim',[0,1]);

ezlegend([0.1,0.75,0.3,0.2],0.5,{'Item 1','Item 2','Item 3'},{'r','g','b'},...
    [12,12,12],{'-','--','.-'},{'r','g','b'},[3,2,1],[0,0,1]);
return