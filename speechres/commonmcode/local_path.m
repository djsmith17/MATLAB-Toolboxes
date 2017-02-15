function p = local_path(inPath, rawPath)
inPathElems = split_path(inPath);
rawPathElems = split_path(rawPath);

if length(inPathElems) <= length(rawPathElems)
    error('rawPath has equal or more elements than inPath');
end

p = '';
for i1 = 1 : length(inPathElems)
    if i1 <= length(rawPathElems)
        p = fullfile(p, rawPathElems{i1});
    else
        p = fullfile(p, inPathElems{i1});
    end
end

return

