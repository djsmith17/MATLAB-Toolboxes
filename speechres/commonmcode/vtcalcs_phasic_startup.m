hostName = getHostName;

if isequal(hostName, 'CNS-PC34')
    baseDir = 'C:\Users\scai\Dropbox\NEUConsult';
    addpath(fullfile(baseDir, 'vtcalcs_new', 'x64', 'Debug', 'x64'));
else
    baseDir = 'C:\Users\systemxp\Documents\My Dropbox\NEUConsult';
    addpath(fullfile(baseDir, 'vtcalcs_new', 'Debug', 'w32'));
end

addpath('e:\speechres\commonmcode');
addpath(fullfile(baseDir, 'vtcalcs_phasic\ADAPT_VC_APSTV2\BIN\Release'));
addpath(fullfile(baseDir, 'optfit'));
addpath(fullfile(baseDir, 'vtlen'));

addpath(fullfile(baseDir, 'vtcalcs_phasic'));
addpath(fullfile(baseDir, 'diva-1-3_phasic'));
cd(fullfile(baseDir, 'diva-1-3_phasic'));

if ~isequal(hostName, 'CNS-PC34')
    DIVA;
    ca;
end

cd(fullfile(baseDir, 'optfit'));

