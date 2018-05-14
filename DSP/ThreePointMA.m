function y = ThreePointMA( x )
% 
% This function computes a three point average of the input signal. 
% 
% y = ThreePointMA( x ); 
% 
% Input x:  Vector of input data. 
% Output y: Filtered data 
%

y = x;

for k = 1:lengh(x)
    y(k) = mean( x(max(k-1,1):min(k+1,length(x))));
end    