function check_file(fileName)
if ~isfile(fileName)
    error('Failed to find file: %s', fileName);
end

return
    