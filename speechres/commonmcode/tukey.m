% tukey - Tukey's post hoc test
% 
% Reference: Keppel G. (1987) Design and Analysis: A Researcher's Handbook (3rd Edition)
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2010-08-10

function varargout=tukey(varargin)
if nargin==5
    df_den=varargin{1};
    k=varargin{2};
    MS_err=varargin{3};
    nSubj=varargin{4};
    alpha=varargin{5};
else
    df_den=input('D.f. of denominator (omnibus F-test): ');
    k=input('Number of groups or treatments (k): ');
    MS_err=input('MS_err = ');
    nSubj=input('Number of subjects in each group: ');
    alpha=input('alpha = ');
end

q=student_range_stat(df_den,k,alpha);
diff_thresh=q*sqrt(MS_err/nSubj);

if nargout==0
    fprintf('\n');
    fprintf('q = %.4f\n',q);
    fprintf('diff_thresh = %.4f\n',diff_thresh);
end

if nargout==2
    varargout{1}=q;
    varargout{2}=diff_thresh;
end

return
