clear;
close all;
%Lab 3:Transfer function synthesis and stability
z = [1.4*exp(1i*pi/3); 1.4*exp(-1i*pi/3); 1.2*exp(2i*pi/3); 1.2*exp(-2i*pi/3)];
p = [0; 0; 0.7*exp(-1i*pi/6); 0.6*exp(1i*pi/6)];
[b,a] = zp2tf(z,p,1);
figure(1);
title('First Plot');
subplot(2,1,1);
zplane(b,a)
title('Zero-Pole Plot');
subplot(2,1,2);
impz(b,a,50);
title('Impulse Response');


z = [1 ; -1];
p = [exp(-1i*pi/4); exp(1i*pi/4)];
[b,a] = zp2tf(z,p,1);
figure(2);
title('Second Plot');
subplot(2,1,1);
zplane(b,a)
title('Zero-Pole Plot');
subplot(2,1,2);
impz(b,a,50);
title('Impulse Response');


z = [0 ; 0];
p = [1; 1];
[b,a] = zp2tf(z,p,1);
figure(3);
title('Third Plot');
subplot(2,1,1);
zplane(b,a)
title('Zero-Pole Plot');
subplot(2,1,2);
impz(b,a,50);
title('Impulse Response');