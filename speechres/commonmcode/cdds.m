function varargout = cdds
dl={'C:\Users\UCUSER\', 'e:','z:','f:','c:', '/users/cais', '/media/DATA', 'e:/scai','e:/NT_Data/scai/','a:','b:','d:','g:','h:','i:','j:','k:','l:','m:','n:',...
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
if nargout == 0
    disp(['Found speechres dir under ',dl]);
end

if nargout == 0
    cd(fullfile(dl,'speechres'));
elseif nargout == 1
    varargout{1} = fullfile(dl,'speechres');
end

% audapterPath = which('TransShiftMex');
% if ~isempty(audapterPath)
%     dns = splitstring(audapterPath, '\');
%     
%     t_dir = '';
%     for i1 = 1 : length(dns) - 4
%         t_dir = fullfile(t_dir, dns{i1});
%     end
%     t_dir = fullfile(t_dir, 'mcode');
%     cd(t_dir);
% end

audapterPath = which('Audapter');
if ~isempty(audapterPath)
    dns = splitstring(audapterPath, '\');
    
    t_dir = '';
    for i1 = 1 : length(dns) - 5
        t_dir = fullfile(t_dir, dns{i1});
    end
    t_dir = fullfile(t_dir, 'scrama', 'mcode');
    cd(t_dir);
end


return