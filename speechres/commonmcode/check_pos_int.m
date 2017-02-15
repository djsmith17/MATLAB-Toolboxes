function check_pos_int(x, msg, varargin)
%%
if nargin == 3
    bAllowZero = varargin{1};
else
    bAllowZero = 0;
end

if (~bAllowZero && (x <= 0)) || (bAllowZero && (x < 0)) || mod(x, 1.0) ~= 0.0
    error('msg');
end
return