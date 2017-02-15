function info_log(infoStr, varargin)
% Input options:
%   '-fn': log file name
%   '-nodate': do not include date and time stamp
%   '-nostdout': do not write to console (stdout)
%   '-warn': set this message as a warning, rather than a regular message
%%
dateStr = datestr(now, 'yyyy-mm-ddTHH:MM:SS.FFF');  % Date string in the ISO format

if isempty(fsic(varargin, '-warn')) && isempty(fsic(varargin, '--warn'))
    typeStr = 'INFO';
    printPort = 1;
else
    typeStr = 'WARNING';
    printPort = 2;
end

if isempty(fsic(varargin, '-nodate'))
    logStr = sprintf('%s @ %s: %s', typeStr, dateStr, infoStr);
else
    logStr = sprintf('%s: %s', typeStr, dateStr, infoStr);
end


if isempty(fsic(varargin, '-nostdout'))
    fprintf(printPort, '%s\n', logStr);
end

if ~isempty(fsic(varargin, '-fn'))
    logFN = varargin{fsic(varargin, '-fn') + 1};
    logF = fopen(logFN, 'at');
    fprintf(logF, '%s\n', logStr);
    fclose(logF);
end

return
