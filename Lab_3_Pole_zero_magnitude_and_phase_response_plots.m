clear;
close all;
% Lab 3 Pole-zero, magnitude, and phase response plot
z = [1];
p = [1; 0.1929; 0.9861; -0.2393; 0.4408; -0.1956; 0.1139];
[zeroes,poles,constant] = tf2zpk(z, p);
figure(1);
title('Digital Filter Response');
subplot(2,1,1);
zplane(zeroes,poles)
title('Zero-Pole Plot');
subplot(2,1,2);
[impulse,t] = impz(z, p);
stem(t,impulse);
title('Impulse Response');
figure(2);
freqz(z,p)
title('Frequency Response');