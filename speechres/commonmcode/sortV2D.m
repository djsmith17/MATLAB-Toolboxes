function v2d_out=sortV2D(v2d_in)
chans=[];
trans=[];
nItems=length(v2d_in);

v2d_out=[];
for i1=1:nItems
    chans=[chans,v2d_in(i1).CHANNEL];
    t_tran=str2num(v2d_in(i1).NAME);
    if isnan(t_tran) || isempty(t_tran)
        fprintf('Error: the %d-th item in v2d_in has a non-numerical name. Aborted.\n')
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
v2d_out=v2d_in(idx_srt);
return