% Initialization of the function
function x = GaussQ( n)
% x = GaussQ( number)
%
% This function generates the value of Qfunction of a given number.
%
% Input: ( n ) = number 
%
% Output : Q function applied value of n
% Date created: 07/06/2016 Author: Tamoghna Chattopadhyay
% 
% -----------------------------------------------------------------

% Function body
x = 0.5 * erfc(n/sqrt(2));
return;