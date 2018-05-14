function xe = ins_zeros( x, I )
% 
% xe = ins_zeros( x, I );
%
% This function will create an extended version of the signal x
% by simply inserting (I-1) zeros between each sample.

% Create extended set. 
xe = zeros( length(x)*I, 1 ); 
xe(1:I:end) = x; 
return;