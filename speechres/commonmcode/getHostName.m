% getHostName: get the host name of the current machine
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2010-06-25

function hn=getHostName(varargin)
[ret,hostName]=system('hostname');
hn=deblank(hostName);
return
