clear;
close all;

%Signal Analysis
load('ecgbn.dat');
ecgfft = abs(fft(ecgbn));
fs=600;
samplelength = length(ecgfft);
fr_x = 0:fs/samplelength:(fs-fs/samplelength);
figure(1);
subplot(2,1,1)
plot(ecgbn)
title('Plot of ECG');
xlabel('Sample');
ylabel('Magnitude');
subplot(2,1,2)
plot(fr_x, ecgfft)
title('Frequency Response of ECG');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

%[~, i_p] = findpeaks(ecgfft(101:1500/2),'MinPeakHeight',20);

%pks = 600*(i_p(1:3) + 99)/1500;
% Peak frequencies of 60, 120, and 180 Hz are found using this 


%Notch Filter design
frequencies = 2*pi*([60 120 180])/600;
frequencies = [frequencies  -frequencies];
poles = 0.95 * exp(-frequencies*i);
zeroes = exp(-frequencies*i);

[b,a] = zp2tf(zeroes',poles', 1);
figure(2);
title('Second Plot');
subplot(2,1,1);
zplane(b,a)
title('Zero-Pole Plot of Notch Filter');
figure(3);
freqz(b,a)
title('Magnitude and Phase Response');

%Filtering signal
filtered_ecgbn = filter(b,a,ecgbn);
figure(4);
subplot(2,1,1);
plot(ecgbn);
title('Plot of ECG');
xlabel('Sample');
ylabel('Magnitude');
subplot(2,1,2);
plot(filtered_ecgbn);
title('Filtered ECG');
xlabel('Sample');
ylabel('Magnitude');

figure(5);
subplot(2,1,1);
plot(fr_x, ecgfft)
title('Frequency Response of ECG');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

filtered_ecgfft =abs(fft(filtered_ecgbn));
subplot(2,1,2);
plot(fr_x, filtered_ecgfft)
title('Frequency Response of ECG');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
