function out = string2intervals(str, bCheckOrder)
%% Constants
sep = ',';

%%
out = {};

str = strrep(str, ' ', '');
if ~isequal(str(end), sep)
    str = [str, sep];
end

idx = 1;
bBracket = 0;
tmpStr = [];
while idx <= length(str)
    if bBracket == 0
        if isequal(str(idx), '[')
            bBracket = 1;
        elseif isequal(str(idx), ']')
            error('Unexpected right bracket');
        elseif isequal(str(idx), sep)
            if isempty(strfind(tmpStr, '-'))
                out{end + 1} = repmat(str2double(tmpStr), 1, 2);
            elseif length(strfind(tmpStr, '-') == 1)
                t_vals = splitstring(tmpStr, '-');
                t_array = [str2double(t_vals{1}), str2double(t_vals{2})];         
                if bCheckOrder
                    t_array = sort(t_array);
                end
                out{end + 1} = t_array;
            end
               
            tmpStr = [];
        else
            tmpStr = [tmpStr, str(idx)];
        end
    else
        if isequal(str(idx), ']')
            bBracket = 0;
            if isempty(strfind(tmpStr, '-'))
                out{end + 1} = repmat(str2double(tmpStr), 1, 2);
            elseif length(strfind(tmpStr, '-') == 1)
                t_vals = splitstring(tmpstr, '-');
                t_array = [str2double(t_vals{1}), str2double(t_vals{2})];         
                if bCheckOrder
                    t_array = sort(t_array);
                end
                out{end + 1} = t_array;     
            end
            
            tmpStr = [];
        elseif isequal(str(idx), '[')
            error('Unexpected left bracket');
        else
            tmpStr = [tmpStr, str(idx)];
        end
        
    end
    idx = idx + 1;
end

%% Prune results
bPreserve = zeros(1, length(out));
for i1 = 1 : length(out)
    bPreserve(i1) = ~isnan(out{i1}(1));        
end

out = out(find(bPreserve));
return