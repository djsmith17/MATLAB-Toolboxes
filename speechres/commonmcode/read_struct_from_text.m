% read_struct_from_test: read a structure from an input text file that contains the field anmes and values
% 
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2013-02-08

function st = read_struct_from_text(infn)
intxt = textread(infn, '%s', 'delimiter', '\n');

st = struct;
for i1 = 1 : numel(intxt)
    t_line = deblank(intxt{i1});
    if isempty(t_line)
        continue;
    end
    
    if isequal(t_line(1), '%')
        continue;
    end
    
    idx_ds = strfind(t_line, '%');
    if ~isempty(idx_ds)
        t_line = t_line(1 : idx_ds(1) - 1);
    end
    if isempty(t_line)
        continue;
    end
    
    t_items = splitstring(t_line);    
    
    if ~(length(t_items) == 1 || length(t_items) == 2)
        fprintf(2, 'WARNING: %s: not exactly one or two items found in line %d of text file %s\n', ...
                mfilename, i1, infn);
        continue;            
    end
    
    if length(t_items) == 1
        st.(t_items{1}) = '';
    else
        if ~isnan(str2double(t_items{2}))
            st.(t_items{1}) = str2double(t_items{2});
        else
            st.(t_items{1}) = t_items{2};
        end
    end
        
end
return
