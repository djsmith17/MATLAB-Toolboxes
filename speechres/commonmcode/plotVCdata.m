function plotVCdata(txt_fn)
% txt_fn = 'C:\Users\systemxp\Desktop\tmp_txt_2.txt';

txt = textread(txt_fn, '%s', 'delimiter', '\n');

x = [];
for i1 = 1 : numel(txt)
    if isempty(deblank(txt))
        continue;
    end
    
    t_line = txt{i1};
    idx_tabs = strfind(t_line, sprintf('\t'));
    t_numtxt = t_line(idx_tabs(1) + 1 : idx_tabs(2) - 1);
    x(end + 1) = str2num(t_numtxt);
end

figure;
plot(x);
return

