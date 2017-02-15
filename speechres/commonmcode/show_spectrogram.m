function show_spectrogram(varargin)
if nargin >= 2
    w = varargin{1};
    fs = varargin{2};
elseif nargin == 1
    wavfn = varargin{1};
    [w, fs] = wavread(wavfn);
else
    fprintf('Wrong number of input arguments\n');
    return
end
    

if isempty(fsic(varargin, 'noFig'))
    figure;
end
% [s, f, t]=spectrogram(w, 128, 96, 1024, fs);
[s, f, t]=spectrogram(w, 256, 192, 1024, fs);
imagesc(t, f, 10 * log10(abs(s))); hold on;
axis xy;
hold on;
set(gca, 'YLim', [f(1), f(end)]);

ylim = 4000;
if ~isempty(fsic(varargin, 'YLim'))
    ylim = varargin{fsic(varargin, 'YLim') + 1};
end
set(gca, 'YLim', [0, ylim]);
set(gca, 'XLim', [t(1), t(end)]);

colormap jet;
return