% strdel - Delete a substring from a string
% 
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2007-10-03

function str1 = strdel(str0, todel)
    idx = 0;
    str1 = str0;
    len = length(todel);
    while (~isempty(idx))
        if (idx ~= 0)
            str1 = [str1(1 : idx(1) - 1), str1(idx(1) + len : end)];
        end
            
        idx = strfind(str1, todel);        
    end
    
return
