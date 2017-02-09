%% Program to generate power spectrum matched noise. This is primarily
%% intended for audiologists to generate their own speech shaped noises
%% based on existing speech Corpus.
%% The input can be any number of wav files. The program derives the
%% fourier transform of all the speech files put together. The Fourier
%% transform thus obtained is then manipulated such that the phases of the
%% spectral components are randomised. The resultant modified fourier
%% output is then converted back into the time domain using an inverse
%% fourier transform. The resultant is a speech shaped noise with spectrum
%% almost identical to that of the original speech corpus

[files,path] = uigetfile([pwd '\*.wav'], 'Select the speech files', 'MultiSelect', 'on'); % Selectin all the wave files to be included in the analysis

[row,col] = size(files); %Determining the number of wave files loaded
long = []; %preallocating the array to concatenate all the speech files
for i = 1:col
    [data,fs] = wavread([path,char(files(i))]);% reading the data file
    data =0.999*data/max(abs(data)); % Normalizing the amplitudes 
    if i ==1
        Fs = fs;
    elseif fs~=Fs 
    specnoise = resample(data,fs,Fs);
    end
    long = [long; data]; % concatenating the speech files

end

spec = abs(fft(long)).*exp(j*2*pi*rand(size(long))); % Applying the fourier transform and randomizing the phases of all the spectral components

noise = real(ifft(spec)); % Obatining the real parts of the IFFT
long = 0.999*long/max(abs(long)); % Normalizing the concatenated speech (For display purposes only)
noise = 0.999*noise/max(abs(noise)); %Normalizing the speech noise amplitude for wavwrite

wavwrite(noise,fs,'speech_noise_phaserand') % Change the name of the wave file to your liking


%% Plotting the Spectra of the speech corpus and the generated noise

fft_x=fft(long);
amp=abs(fft_x);
n=length(fft_x);
freq=fs/n.*(1:n);
aspeech=amp(1:(n/2));
f=freq(1:(n/2));
plot(f,aspeech,'k');

fft_x=fft(noise);
amp=abs(fft_x);
n=length(fft_x);
freq=fs/n.*(1:n);
anoise=amp(1:(n/2));
f=freq(1:(n/2));

hold on

plot(f,anoise,'r');


legend('Speech', 'Noise')
