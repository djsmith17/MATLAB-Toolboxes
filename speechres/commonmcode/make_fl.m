function fl = make_fl(dirName,n1,n2)
fl = {};
d = dir(fullfile(dirName,'*.daq'));

for i1=1:numel(d)
    fn = d(i1).name;
    idx_us = strfind(fn,'_');
    if numel(idx_us)~=8 
        continue;
    end
    num_str = fn(idx_us(end-1)+1 : idx_us(end)-1);
    trial_num = str2num(num_str);
    if trial_num>=n1 && trial_num<=n2
        fl{end+1} = fullfile(dirName,fn);
    end
end
return