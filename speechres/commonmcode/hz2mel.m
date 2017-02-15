% hz2mel: Convert frequency in Hz to mel
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2008-04-01

function mel=hz2mel(hz)
    mel=1127.01048*log(1+hz/700);
return
