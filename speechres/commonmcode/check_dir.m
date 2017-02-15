function check_dir(dirName, varargin)
if isempty(fsic(varargin, '-create'))
    if ~isdir(dirName)
        error('Failed to find directory: %s', dirName);
    end
else
    if ~isdir(dirName)
        mkdir(dirName);
        if ~isdir(dirName)
            error('Failed to create directory: %s', dirName);
        end
    end
end
return