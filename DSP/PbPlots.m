clear all
clc

M = 4; %Number of possible messages
gdB = 0:.01:20; %gamma_b in dB 
g =  10 .^ (gdB/10); %actual value of gamma_b

for i = 1:length(g) 
   
    
    Pb_MPAM(i) = (2 * (M-1) * GaussQ ( sqrt( (6 * g(i) * log2(M))/ (M*M - 1 )))) / (M * log2(M));
    Pb_MPSK(i) = (2 * GaussQ ( (sqrt( 2 * g(i) * log2(M))) * sin (pi/M))) / log2(M);
    Pb_MQAM(i) = (4 * GaussQ ( sqrt( (3 * g(i) * log2(M))/ (M - 1 )))) / log2(M);
    
end

%Obtain Plots
semilogy(gdB,Pb_MPAM,'r.','LineWidth',3);
hold on;
grid;
semilogy(gdB,Pb_MPSK,'b--','LineWidth',3);
semilogy(gdB,Pb_MQAM,'k-','LineWidth',3);
legend(strcat(num2str(M),'-MPAM'),strcat(num2str(M),'-MPSK'),strcat(num2str(M),'-MQAM'));
title('Comparison of Probability Errors');
xlabel('\gamma_b (dB)');
ylabel('P_b');
hold off;


