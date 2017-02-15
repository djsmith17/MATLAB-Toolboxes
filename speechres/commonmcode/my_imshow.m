function my_imshow(im,varargin)
if isempty(varargin)
    imshow(im,[min(min(im)),max(max(im))]);
else
    imshow(im,varargin{1});
end
axis equal;
xs=get(gca,'XLim'); ys=get(gca,'YLim');
text(xs(1)+0.05*range(xs),ys(2)-0.075*range(ys),...
    sprintf('min=%.2e; max=%.2e',min(min(im)),max(max(im))),'Color','y');
return