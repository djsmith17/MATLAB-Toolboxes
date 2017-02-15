function pathElems = split_path(inPath)
pathElems = {};

[inPath, inF, extName] = fileparts(inPath);
pathElems{end + 1} = strcat(inF, extName);
while ~isempty(inPath) && ~isempty(inF)
    [inPath, inF, extName] = fileparts(inPath);
    pathElems{end + 1} = strcat(inF, extName);
end

if ~isempty(inPath)
    pathElems{end} = inPath;
else
    pathElems{end} = inF;
end 
pathElems = fliplr(pathElems);

return