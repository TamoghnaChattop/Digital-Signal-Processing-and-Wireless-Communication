clear all;
close all;

ht=40;
hr=3;
freq=1800e6;
c=3e8;
wavelength=c/freq;
G1=1.5;
R=-2;

figure(1);
d=[1:1:100000];
GR=2;
l=(d.^2+(ht-hr)^2).^.5;
r=(d.^2+(ht+hr)^2).^.5;
phase=2*pi/wavelength*(r-1);
dc=4*ht*hr/wavelength;
dnew=[dc:1:100000];

vec=sqrt(G1)./l+R*sqrt(GR)./r.*exp(phase*sqrt(-1));
Pr=(wavelength/4/pi)^2*(abs(vec)).^2;
loglog(10*log10(d),10*log10(Pr));
title('Two­Ray Model');
xlabel('Distance(m)');
ylabel('Received Power (dbm)');
grid;

figure(2);
loglog(d,Pr);
title('Two­Ray Model');
xlabel('Distance(m)');
ylabel('Received Power (dbm)');
grid;