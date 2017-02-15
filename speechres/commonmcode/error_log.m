function error_log(errStr, varargin)
% Input options:
%   '-fn': log file name
%   '-nodate': do not include date and time stamp

%%
dateStr = datestr(now, 'yyyy-mm-ddTHH:MM:SS.FFF');  % Date string in the ISO format

if isempty(fsic(varargin, '-nodate'))
    logStr = sprintf('ERROR @ %s: %s', dateStr, errStr);
else
    logStr = sprintf('%s', dateStr, errStr);
end

if ~isempty(fsic(varargin, '-fn'))
    logFN = varargin{fsic(varargin, '-fn') + 1};
    logF = fopen(logFN, 'at');
    fprintf(logF, '%s\n', logStr);
    fclose(logF);
end

error('%s', logStr);

return