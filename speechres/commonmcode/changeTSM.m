% tFN=which('TransShiftMex');
% [tPath,jnk]=fileparts(tFN);
% if (~isempty(strfind(tPath,'Z:\speechres\adapt\ADAPT_VC\BIN\release')))
%     rmpath(tPath);
%     addpath('Z:\speechres\adapt\ADAPT_VC_TRIPH\BIN\release');
% %     addpath('Z:\speechres\adapt\ADAPT_VC_TRIPH\BIN\release');
% elseif (~isempty(strfind(tPath,'Z:\speechres\adapt\ADAPT_VC_RATIO\BIN\release')))
%     rmpath(tPath);
%     addpath('Z:\speechres\adapt\ADAPT_VC_TRIPH\BIN\release');
% end

%% 2009/07/02
tFN=which('TransShiftMex');
[tPath,jnk]=fileparts(tFN);
if (~isempty(strfind(tPath,'Z:\speechres\adapt\ADAPT_VC\BIN\release')))
    rmpath(tPath);
    addpath('Z:\speechres\adapt\ADAPT_VC_TRIPH_R\BIN\release');
%     addpath('Z:\speechres\adapt\ADAPT_VC_TRIPH\BIN\release');
elseif (~isempty(strfind(tPath,'Z:\speechres\adapt\ADAPT_VC_RATIO\BIN\release')))
    rmpath(tPath);
    addpath('Z:\speechres\adapt\ADAPT_VC_TRIPH_R\BIN\release');
end