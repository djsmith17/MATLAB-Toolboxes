% mel2hz - Convert frequency value in mel to Hz
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2008-04-03

function hz=mel2hz(mel)
    hz=(exp(mel/1127.01048)-1)*700;
return
