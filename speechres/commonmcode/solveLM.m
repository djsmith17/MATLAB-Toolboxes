function [beta,rho,Xhat,res]=solveLM(X,Y,varargin)
% Solve the parametric vector of a linear model (beta), 
%   based on the design matrix X and the observation matrix Y. rho is the
%   estimated autocorrelation coefficient in AR(1).
%   This routine attempts to prewhiten the data through a two-pass
%   processing, a la (Worsley, Liao, Aston et al., 2002, NeuroImage,
%   15:1-15). 
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2010-01-20
% 
% % load solveLM_data;  % gives X and Y
% X=[0*ones(100,1);1*ones(100,1)];
% Y=X*5;
% noise=nan(size(Y));
% noise(1)=randn;
% for n=2:length(Y)
%     noise(n)=randn+0.6*noise(n-1);
% end
% Y=Y+noise;

nu=length(Y)-rank(X);

% Pass 1
beta=pinv(X)*Y;
res=Y-X*beta;
rho=myCorrCoeff(res(1:end-1),res(2:end));
% rho=sum(res(1:end-1).*res(2:end))/sum(res.^2);
Xhat=X;

if ~isempty(findStringInCell(varargin,'onePass'))
    return
end

factor=1./sqrt(1-rho^2);

% Pass 2
Yhat=(Y(2:end)-rho*Y(1:end-1))*factor;
Yhat=[Y(1);Yhat];

Xhat=[];
for n=1:size(X,2)
    Xhat0=(X(2:end,n)-rho*X(1:end-1,n))*factor;
    Xhat0=[X(1,n);Xhat0];
    Xhat=[Xhat,Xhat0];
end

beta=pinv(Xhat)*Yhat;
res=Yhat-Xhat*beta;
return
