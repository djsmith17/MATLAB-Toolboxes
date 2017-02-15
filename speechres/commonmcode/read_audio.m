function [y, fs] = read_audio(fileName)
fp = which('audioread');

if ~isempty(fp)
    [y, fs] = audioread(fileName);
else
    [y, fs] = wavread(fileName);
end

end