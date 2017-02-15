function showSpectrogram(w,fs)
% w - waveform
% fs - sampling rate (Hz)

figure;
[s,f,t]=spectrogram(w,128,96,1024,fs);
imagesc(t,f,10*log10(abs(s))); hold on;
axis xy;
hold on;
set(gca,'YLim',[0,3000]);

xlabel('Time (sec)'); 
ylabel('Frequency (Hz');

return