function calData_out=sortV2D(calData_in)
chans=[];
trans=[];
nItems=length(calData_in);

calData_out=[];
for i1=1:nItems
    chans=[chans,calData_in(i1).CHANNEL];
    t_tran=str2num(calData_in(i1).NAME);
    if isnan(t_tran) || isempty(t_tran)
        fprintf('Error: the %d-th item in calData_in has a non-numerical name. Aborted.\n')
        return
    end
    trans=[trans,t_tran];
end

if max(trans)>100
    fprintf('Error: maximum chan# > 100. Aborted');
    return;
end
codes=chans*1e3 + trans;
[foo,idx_srt]=sort(codes);
calData_out=calData_in(idx_srt);
return