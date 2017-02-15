function plotSpectrogram(x,fs)
figure;
[s,f,t]=spectrogram(x,128,96,1024,fs);
imagesc(t,f,10*log10(abs(s)));
axis xy;
hold on;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
return