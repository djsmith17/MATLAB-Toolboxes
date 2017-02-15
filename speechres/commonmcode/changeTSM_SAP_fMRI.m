tFN=which('TransShiftMex');
[tPath,jnk]=fileparts(tFN);
if (~isempty(strfind(tPath,'Z:\speechres\adapt\ADAPT_VC\BIN\release')))
    rmpath(tPath);
elseif (~isempty(strfind(tPath,'Z:\speechres\adapt\ADAPT_VC_TRIPH\BIN\release')))
    rmpath(tPath)
end
addpath('Z:\speechres\adapt\ADAPT_VC_RATIO\BIN\release');