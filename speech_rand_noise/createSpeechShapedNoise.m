function createSpeechShapedNoise(varargin)
% createSpeechShapedNoise(varargin) creates power spectrum matched noise. 
% By default, this script will use a speech corpus that is included in the
% containing folder. An input of 1 to the function will allow you to choose
% a directory that includes a custom speech corpus.
%
% This script has been adapted from the script speech_rand_noise developed 
% by Nike Gnanateja 2016 
% https://www.mathworks.com/matlabcentral/fileexchange/37842-speech-in-noise-mixing--signal-to-noise-ratio
%
% This is primarily intented for audiologists to generate their own speech
% shaped noises based on existing speech corpus.
% The input can be any number of wav files. The program derives the fourier
% transform of all the speech files put together. The Fourier transform
% thus obtained is then manipulated such that the phases of the spectral
% components are randomised. The resultant modified Fourier output is then
% converted back into the time doiamin using an inverse fourier transform.
% The resultant is a speech shaped noise with spectrum almost identical to
% that of the original speech corpus. 

clear
if isempty(varargin)
else
    % Selecting all the wave files to be included in the analysis
    [files, path] = uigetfile([pwd '\*.wav'], 'Select the speech files', 'MultiSelect', 'on');
end
    

numFiles = length(files); % Determining the number of wave files loaded
long = [];                % Preallocating the array to concatenate all the speech files
for i = 1:numFiles
    filename = fullfile(path, files{i});
    [data, fs] = audioread(filename); % reading the data file
    data = 0.999*data/max(abs(data)); % Normalizing the amplitudes 
    if i == 1
        Fs = fs;
    elseif fs~=Fs 
        specnoise = resample(data,fs,Fs);
    end
    long = [long; data]; % concatenating the speech files
end

spec = abs(fft(long)).*exp(j*2*pi*rand(size(long))); % Applying the fourier transform and randomizing the phases of all the spectral components

noise = real(ifft(spec)); % Obatining the real parts of the IFFT
long  = 0.999*long/max(abs(long)); % Normalizing the concatenated speech (For display purposes only)
noise = 0.999*noise/max(abs(noise)); %Normalizing the speech noise amplitude for wavwrite

audiowrite('SSN.wav', noise, fs) % Change the name of the wave file to your liking

% Plotting the Spectra of the speech corpus and the generated noise
fft_x  = fft(long);
amp    = abs(fft_x);
n      = length(fft_x);
freq   = fs/n.*(1:n);
aspeech=amp(1:(n/2));
f = freq(1:(n/2));

fft_x  = fft(noise);
amp    = abs(fft_x);
n      = length(fft_x);
freq   = fs/n.*(1:n);
anoise = amp(1:(n/2));
f = freq(1:(n/2));

plotpos = [10 100];
plotdim = [1600 600];

SSNFig = figure('Color', [1 1 1]);
set(SSNFig, 'Position', [plotpos plotdim],'PaperPositionMode','auto')

plot(f, aspeech,'k');
hold on
plot(f, anoise,'r');
xlabel('Frequency (Hz)')
ylabel('Magnitude')

axis([50 10000 0 15000])
set(gca, 'XScale', 'log')
box off

legend('Speech', 'Noise')
