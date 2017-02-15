% scheffe: Scheffe's method test
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2010-08-05

function varargout=scheffe(varargin)
% scheffe(df_num,df_den,alpha,nGroup)
%   or
% scheffe()

if nargin==0
    df_num=input('D.f. of numerator (omnibus F-test): ');
    df_den=input('D.f. of denominator (omnibus F-test): ');
    alpha=input('alpha = ');
    nGroup=input('Number of groups or treatments: ');

   
elseif nargin==4
    df_num=varargin{1};
    df_den=varargin{2};
    alpha=varargin{3};
    nGroup=varargin{4};
end
   

F_omnibus=finv(1-alpha,df_num,df_den);

F_thresh=(nGroup-1)*F_omnibus;

if nargout==0
    fprintf('\n');
    fprintf('F_omnibus = %.4f\n',F_omnibus);
    fprintf('F_thresh = %.4f\n',F_thresh);
elseif nargout==1
    varargout{1}=F_thresh;
elseif nargout==2
    varargout{1}=F_thresh;
    varargout{2}=F_thresh;
end

return
