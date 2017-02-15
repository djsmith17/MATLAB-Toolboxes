function se=nanste(x)
x1=x(~isnan(x));
se=ste(x1);    
return
