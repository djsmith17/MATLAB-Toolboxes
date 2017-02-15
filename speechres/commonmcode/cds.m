function cds(varargin)
%%
dl={'C:\Users\UCUSER\', 'z:','e:','f:', '/users/cais/', '/media/DATA', 'c:', 'e:/scai/','e:/NT_Data/scai/','a:','b:','d:','g:','h:','i:','j:','k:','l:','m:','n:',...
    'o:','p:','q:','r:','s:','t:','u:','v:','w:','x:','y:'};
dirFound=0;
for i1=1:length(dl)
    if isdir(fullfile([dl{i1}],'speechres'))
        dirFound=1;
        break;
    end
end

if dirFound==0;
    fprintf('speechres dir not found. Given up.\n');
    return
end
dl=[dl{i1}];
disp(['Found speechres dir under ',dl]);
%%

if (nargin==0 || (nargin==1 && isequal(varargin{1},'triphSA')))
% 	addpath(fullfile(dl,'speechres/adapt/ADAPT_VC/BIN/release'));
    addpath(fullfile(dl,'speechres/adapt/ADAPT_VC_TRIPH_R/BIN/release'));
	addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/adapt/mcode'));
	addpath(fullfile(dl,'speechres/adapt/da'));
	addpath(fullfile(dl,'speechres/adapt/perctest'));
	addpath(fullfile(dl,'speechres/adapt/synutter'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
	addpath(fullfile(dl,'speechres/signals/SimTriphthongs'));
	
	addpath(fullfile(dl,'speechres/adapt/triphcode'));
	addpath(fullfile(dl,'speechres/adapt/supra'));

% 	addpath G:/scai/speechres/asr/htk/mcode
elseif (nargin==1 && (isequal(varargin{1},'sap-fmri') || isequal(varargin{1},'SAP-fMRI') || isequal(varargin{1},'SAP-FMRI')))
	addpath(fullfile(dl,'speechres/adapt/ADAPT_VC_RATIO/BIN/release'));
	addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/adapt/synutter'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
	addpath(fullfile(dl,'speechres/adapt/perctest'));
	
	addpath(fullfile(dl,'speechres/sap-fmri/mcode'));
	addpath(fullfile(dl,'speechres/sap-fmri/dacode')); 
    
elseif (nargin==1 && (isequal(varargin{1},'dys') || isequal(varargin{1},'DYS')))
    addpath(fullfile(dl,'speechres/adapt/ADAPT_VC_RATIO/BIN/release'));
	addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/adapt/synutter'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
	addpath(fullfile(dl,'speechres/adapt/perctest'));
	
	addpath(fullfile(dl,'speechres/dys/mcode'));
    addpath(fullfile(dl,'speechres/dys/perccode'));
	addpath(fullfile(dl,'speechres/dys/dacode')); 

% 	addpath G:/scai/speechres/asr/htk/mcode	
elseif (nargin==1 && (isequal(varargin{1},'rhythm-fmri') || isequal(varargin{1},'RHYTHM-fMRI')))
% 	addpath(fullfile(dl,'speechres/rhythm-fmri/ADAPT_VC_RATIO_RHYTHM/BIN/release'));
%     addpath(fullfile(dl,'speechres/pip/Audapter-PIP/BIN/debug'));
    addpath(fullfile(dl,'speechres/pip/Audapter-PIP_RHY/BIN/release'));

	addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/adapt/synutter'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
	addpath(fullfile(dl,'speechres/adapt/perctest'));
	
	addpath(fullfile(dl,'speechres/rhythm-fmri/mcode'));
    addpath(fullfile(dl,'speechres/rhythm-fmri/asrcode'));
	addpath(fullfile(dl,'speechres/rhythm-fmri/dacode'));
    
%     addpath(fullfile(dl,'speechres/pip/mcode'));
    
    addpath(fullfile(dl, 'speechres/utils/mexCommandWrapper/Release'));

%     cdds;
    cd(fullfile(dl,'speechres/rhythm-fmri/mcode'));
elseif (nargin==1 && (isequal(lower(varargin{1}),'apst')))
	addpath(fullfile(dl,'speechres/apst/ADAPT_VC_APST/BIN/release'));
	addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/adapt/synutter'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
	addpath(fullfile(dl,'speechres/adapt/perctest'));
	
	addpath(fullfile(dl,'speechres/apst/mcode'));
    addpath(fullfile(dl,'speechres/apst/dacode'));
elseif (nargin==1 && (isequal(lower(varargin{1}),'apst2')))
	addpath(fullfile(dl,'speechres/apst2/ADAPT_VC_APST_2/BIN/release'));	
	addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/adapt/synutter'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
	addpath(fullfile(dl,'speechres/adapt/perctest'));
	
	addpath(fullfile(dl,'speechres/apst2/mcode'));
elseif (nargin==1 && (isequal(lower(varargin{1}),'apstv'))) 
	addpath(fullfile(dl,'speechres/apstv/ADAPT_VC_APSTV/BIN/release'));	
	addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/adapt/synutter'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
	addpath(fullfile(dl,'speechres/adapt/perctest'));
	
	addpath(fullfile(dl,'speechres/apstv/mcode'));
elseif (nargin==1 && (isequal(lower(varargin{1}),'apstv2'))) 
	addpath(fullfile(dl,'speechres/apstv2/ADAPT_VC_APSTV2/BIN/release'));
    addpath(fullfile(dl,'speechres/apstv2/multiSylArticMex/multiSylArticMex/Release'));
    
	addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/adapt/synutter'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
	addpath(fullfile(dl,'speechres/adapt/perctest'));
	
	addpath(fullfile(dl,'speechres/apstv2/mcode'));    
elseif (nargin==1 && (isequal(lower(varargin{1}),'apstv_nw'))) 
	addpath(fullfile(dl,'speechres/apstv_nw/ADAPT_VC_APSTV_NW/BIN/release'));	
	addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/adapt/synutter'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
	addpath(fullfile(dl,'speechres/adapt/perctest'));
	
	addpath(fullfile(dl,'speechres/apstv_nw/mcode'));	
elseif (nargin==1 && (isequal(lower(varargin{1}),'apat'))) 
	addpath(fullfile(dl,'speechres/apat/ADAPT_VC_APAT_3/BIN/release'));	
	addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/adapt/synutter'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
	addpath(fullfile(dl,'speechres/adapt/perctest'));
	
	addpath(fullfile(dl,'speechres/apat/mcode'));	
elseif (nargin==1 && (isequal(varargin{1},'tua') || isequal(varargin{1},'TUA')))
	addpath(fullfile(dl,'speechres/apstv/ADAPT_VC_APSTV/BIN/release'));
	addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/adapt/synutter'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
	addpath(fullfile(dl,'speechres/adapt/perctest'));
	
	addpath(fullfile(dl,'speechres/tua/mcode'));
	addpath(fullfile(dl,'speechres/tua/dacode'));
elseif (nargin==1 && (isequal(varargin{1},'rt') || isequal(varargin{1},'RT')))
	addpath(fullfile(dl,'speechres/rt/RTMex/BIN/release'));
	addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/adapt/synutter'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
	addpath(fullfile(dl,'speechres/adapt/perctest'));
	
	addpath(fullfile(dl,'speechres/rt/mcode'));
	addpath(fullfile(dl,'speechres/rt/dacode'));    
    addpath(fullfile(dl,'speechres/amt/mcode'));
    addpath(fullfile(dl,'speechres/amt/dacode'));
elseif (nargin==1 && (isequal(varargin{1},'slap') || isequal(varargin{1},'SLAP')))
	addpath(fullfile(dl,'speechres/slap/ADAPT_VC_SLAP/BIN/release'));
	addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
	
	addpath(fullfile(dl,'speechres/slap/mcode'));
	addpath(fullfile(dl,'speechres/slap/dacode'));
	addpath(fullfile(dl,'speechres/slap/asr'));
    
elseif (nargin==1 && (isequal(lower(varargin{1}),'pitchshift')))
    addpath(fullfile(dl,'/speechres/PitchShift/AudapterPitch/BIN/debug'));
    addpath(fullfile(dl,'speechres/commonmcode'));
	addpath(fullfile(dl,'speechres/commonmcode/graph'));
	addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
    
    addpath(fullfile(dl,'speechres/PitchShift/mcode'));
    
elseif (nargin==1 && (isequal(lower(varargin{1}),'stut')))   
    addpath(fullfile(dl,'speechres/marksTools/matlab'));
    addpath(fullfile(dl,'speechres/waveTools/mcode'));
    startup_mkt;
    fprintf('startup_mkt done.\n');
    
    addpath(fullfile(dl,'speechres/commonmcode'));
    addpath(fullfile(dl,'speechres/commonmcode/graph'));
    
    addpath(fullfile(dl,'speechres/stut/mcode'));
    
elseif (nargin==1 && (isequal(lower(varargin{1}),'daf')))   
    addpath(fullfile(dl,'speechres/commonmcode')); 
    addpath(fullfile(dl,'speechres/daf/Audapter-DAF/BIN/release'));
    
    addpath(fullfile(dl,'speechres/daf/Audapter'));
    addpath(fullfile(dl,'speechres/daf/mcode'));
    addpath(fullfile(dl,'speechres/daf/pvoc'));
    
elseif (nargin == 1 && (isequal(lower(varargin{1}), 'kape')))
    addpath(fullfile(dl,'speechres/commonmcode')); 
    addpath(fullfile(dl,'speechres/kape/ADAPT_VC_RATIO/BIN/release'));
        
    addpath(fullfile(dl,'speechres/kape/mcode'));
    
    cdds;
    
elseif (nargin == 1 && (isequal(lower(varargin{1}), 'kape2')))
    addpath(fullfile(dl,'speechres/commonmcode')); 
    addpath(fullfile(dl,'speechres/kape2/ADAPT_VC_RATIO/BIN/release'));
        
    addpath(fullfile(dl,'speechres/kape2/mcode'));
    
    cdds;
    
elseif (nargin == 1 && (isequal(lower(varargin{1}), 'scrama')))
    % Sleep and circadian rhythm and auditory-motor adaptation %
    addpath(fullfile(dl,'speechres/commonmcode')); 

    if isequal(getHostName, 'b412opti790')
        addpath(fullfile(dl,'speechres/audapter/Audapter-2.0/BIN/release_UCh'));
    else
        addpath(fullfile(dl,'speechres/pip/Audapter-2.0-SDAP2/BIN/release'));
    end

    addpath(fullfile(dl,'speechres/scrama/mcode'));
    addpath(fullfile(dl,'speechres/scrama/asrcode'));
    
    addpath(fullfile(dl,'speechres/Audapter-DA/mcode'));
    addpath(fullfile(dl,'speechres/Audapter-DA/mcode/preproc'));
   
    cd(fullfile(dl,'speechres/scrama/mcode'));
    
elseif (nargin == 1 && (isequal(lower(varargin{1}), 'sdap')))
    addpath(fullfile(dl, 'speechres/commonmcode'));
    addpath(fullfile(dl, 'speechres/sdap/mcode'));
    addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
    
    addpath(fullfile(dl, 'speechres/sdap/Audapter-DAF/BIN/release'));
    
elseif (nargin == 1 && (isequal(lower(varargin{1}), 'sdap2')))
    addpath(fullfile(dl, 'speechres/commonmcode'));
    addpath(fullfile(dl, 'speechres/sdap2/mcode'));
    addpath(fullfile(dl, 'speechres/signals/leveltest'));
	addpath(fullfile(dl, 'speechres/signals/maskNoise'));
    
    addpath(fullfile(dl, 'speechres/pip/Audapter-2.0-SDAP2/BIN/release'));
%     addpath(fullfile(dl, 'speechres/sdap2/Audapter-DAF/BIN/release'));
    
    cd(fullfile(dl, 'speechres/sdap2/mcode'));
elseif (nargin == 1 && (isequal(lower(varargin{1}), 'blueshift')))
    addpath(fullfile(dl, 'speechres/commonmcode'));
    addpath(fullfile(dl, 'speechres/blueshift/mcode'));
    addpath(fullfile(dl,'speechres/signals/leveltest'));
	addpath(fullfile(dl,'speechres/signals/maskNoise'));
    
    addpath(fullfile(dl, 'speechres/blueshift/Audapter-Blueshift/BIN/release'));
elseif (nargin == 1 && (isequal(lower(varargin{1}), 'pip'))) % Pitch and intensity perturbation
    addpath(fullfile(dl, 'speechres/commonmcode'));
    addpath(fullfile(dl, 'speechres/pip/mcode'));
    addpath(fullfile(dl, 'speechres/signals/leveltest'));
    addpath(fullfile(dl,'speechres/signals/maskNoise'));
    
    addpath(fullfile(dl, 'speechres/pip/Audapter-PIP/BIN/release'));
    
    cdds;
    
elseif (nargin == 1 && (isequal(lower(varargin{1}), 'cca')))    % cca stands for "consonant context and adaptation
    addpath(fullfile(dl, 'speechres/commonmcode'));
    addpath(fullfile(dl, 'speechres/cca/mcode'));
    
    addpath(fullfile(dl, 'speechres/pip/Audapter-2.0/BIN/release'));
    
    cdds;
    
elseif (nargin == 1 && (isequal(lower(varargin{1}), 'ape_fmt')))    % CollabUIUC
    addpath(fullfile(dl, 'speechres/commonmcode'));
    addpath(fullfile(dl, 'speechres/ape_fmt/mcode'));
    
    if isequal(getHostName, 'SHS-NAMBLABNEW')
        addpath(fullfile(dl, 'speechres/audapter/Audapter-2.0/BIN/Release_UIUC'));
    else
        addpath(fullfile(dl, 'speechres/pip/Audapter-2.0-SDAP2/BIN/Release'));
    end
    
    cd(fullfile(dl, 'speechres/ape_fmt/mcode'));
    
    rmpath('C:\LSSmatlab\speech\');
    
elseif (nargin == 1 && (isequal(lower(varargin{1}), 'ape_pitch')))    % CollabNWU
    addpath(fullfile(dl, 'speechres/commonmcode'));
    addpath(fullfile(dl, 'speechres/ape_pitch/mcode'));
    
    if isequal(lower(getHostName), 'smcg_w510')
        addpath(fullfile(dl, 'speechres/pip/Audapter-2.0-SDAP2/BIN/Release'));
    else
        addpath(fullfile(dl, 'speechres/audapter/Audapter-2.0/BIN/Release_NWU'));
    end   
    
elseif (nargin == 1 && (isequal(lower(varargin{1}), 'audapter_matlab')))    % CollabNWU
    addpath(fullfile(dl, 'speechres/commonmcode'));
    addpath(fullfile(dl, 'speechres/audapter_matlab/mcode'));
    
    addpath(fullfile(dl, 'speechres/audapter/Audapter-2.1/BIN/Release'));
    
    cd(fullfile(dl, 'speechres/audapter_matlab/mcode'));    
	
    
elseif (nargin == 1 && (isequal(lower(varargin{1}), 'ape')))    % CollabNWU
    addpath(fullfile(dl, 'speechres/commonmcode'));
    addpath(fullfile(dl, 'speechres/ape/mcode'));
    
    if isequal(lower(getHostName), 'e530')
        addpath(fullfile(dl, 'speechres/audapter/Audapter-2.0/BIN/Release_USyd'));
    else
        addpath(fullfile(dl, 'speechres/audapter/Audapter-2.0/BIN/Release'));
    end   
    
    cd(fullfile(dl, 'speechres/ape/mcode'));
end

% if isdir('C:/marksTools/matlab')
%     addpath C:/marksTools/matlab
%     startup_mkt;
%     fprintf('startup_mkt done./n');
% end

return
