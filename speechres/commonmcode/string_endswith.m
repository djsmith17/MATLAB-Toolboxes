function b = string_endswith(str, subs)
if isempty(subs) || isempty(str)
    b = 0;
    return
end

%%
if (length(str) >= length(subs)) ...
   && isequal(str(end - length(subs) + 1 : end), subs)
    b = 1;
else
    b = 0;
end

return