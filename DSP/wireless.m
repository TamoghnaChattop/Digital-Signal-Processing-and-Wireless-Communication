clear all;
close all;
ht=50;
hr=2;
freq=900e6;
c=3e8;
wavelength=c/freq;
G1=1;
R=-1;
count=1;
figure(1);
d=[1:1:100000];
GR=[1,0.316,0.1,0.01];
l=(d.^2+(ht-hr)^2).^.5;
r=(d.^2+(ht+hr)^2).^.5;
phase=2*pi/wavelength*(r-1);
dc=4*ht*hr/wavelength;
dnew=[dc:1:100000];

for count = 1:1:4
    
    Gr=GR(count);
    vec=G1./1+R*Gr./r.*exp(phase*sqrt(-1));
    Pr=(wavelength/4/pi)^2*(abs(vec)).^2;
    subplot(2,2,count);
    plot(10*log10(d),10*log10(Pr)-10*log10(Pr(1)));
    hold on;
    plot(10*log10(dnew),-20*log10(dnew));
    plot(10*log10(dnew),-40*log10(dnew));
    title('Power Falloff');
    xlabel('log distance');
    ylabel('power loss');
    grid;
end
hold off;

figure;
plot(10*log10(d),10*log10(Pr));%-10*log10(Pr(1)));
title('dB Power vs Log Distance graph');
xlabel('log(d)');
ylabel('10*log(Pr)');
grid;
