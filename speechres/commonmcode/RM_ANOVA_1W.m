function varargout=RM_ANOVA_1W(X,names,varargin)
% RM_ANOVA_1W(x,name)
%   X: the data table, with each column corresponde to one treatment condition
%   names: a row cell with names of the treatment conditions
%
% Shanqing Cai (cais@mit.edu)
% Reference: Keppel G. (1987) Design and Analysis: A Researcher's Handbook (3rd Edition)
% Validated against SYSTAT

%%
alpha=0.05;

%%

T=sum(X(:));    % Total sum
a=size(X,2);    % Number of treatment conditions
if a~=length(names)
    fprintf('ERROR: size of name does not match the number of treatment conditions.\n')
    return
end

n=size(X,1);    % Number of subjects

T_S=T*T/a/n;
A=sum(X);       % Per-treatment sums
S=sum(X');      % Per-subject sums

A_S=sum(A.^2)/n;
S_S=sum(S.^2)/a;

Y_S=sum(X(:).^2);

SS_A=A_S-T_S;
SS_SA=Y_S-A_S-S_S+T_S;

df_A=a-1;
df_SA=(a-1)*(n-1);

MS_A=SS_A/df_A;
MS_SA=SS_SA/df_SA;

F=MS_A/MS_SA;
    
% df_A_GG=1;
% df_SA_GG=n-1;

p_omnibus=1-fcdf(F,df_A,df_SA);
% p_omnibus_GG=1-fcdf(F,df_A_GG,df_SA_GG);

omniRes=struct;
omniRes.SS_A=SS_A;
omniRes.SS_SA=SS_SA;
omniRes.MS_A=MS_A;
omniRes.MS_SA=MS_SA;
omniRes.df_A=df_A;
omniRes.df_SA=df_SA;
omniRes.F=F;
omniRes.p=p_omnibus;
% omniRes.p_GG=p_omnibus_GG;

%% Compute epsilons for the sphericity assumption
Xvec=[];
BFac=[];
WFac=[];
Subj=[];
for i1=1:size(X,2)
    Xvec=[Xvec;X(:,i1)];
    BFac=[BFac;ones(size(X(:,i1)))];
    WFac=[WFac;i1*ones(size(X(:,i1)))];
    Subj=[Subj;transpose([1:size(X,1)])];
end

[EpsHF,EpsList,EpsGG]=GenCalcHFEps(Xvec,BFac,WFac,Subj);

df_A_HF=df_A*EpsHF;
df_SA_HF=df_SA*EpsHF;
p_omnibus_HF=1-fcdf(F,df_A_HF,df_SA_HF);

df_A_GG=df_A*EpsGG;
df_SA_GG=df_SA*EpsGG;
p_omnibus_GG=1-fcdf(F,df_A_GG,df_SA_GG);

omniRes.p_HF=p_omnibus_HF;
omniRes.p_GG=p_omnibus_GG;

%% Pair-wise 1-df comparisons
if ~isempty(fsic(varargin,'contrasts'))
    cons=varargin{fsic(varargin,'contrasts')+1};
end
conRes=cell(1,0);

for i1=1:numel(cons)
%     conVec=zeros(1,numel(names));
%     idxmns=strfind(cons{i1},'-');
%     name1=cons{i1}(1:idxmns-1);
%     name2=cons{i1}(idxmns+1:end);
%     idx1=fsic(names,name1);
%     idx2=fsic(names,name2);
%     conVec(idx1)=1;
%     conVec(idx2)=-1; 
    conVec=cons{i1};
    
    Yct=X.*repmat(conVec,n,1);
    idx_pos=find(conVec>0);
    idx_neg=find(conVec<0);
    
    if numel(idx_pos)>1
        Yc(:,1)=transpose(sum(transpose(Yct(:,idx_pos))));
    else
        Yc(:,1)=Yct(:,idx_pos);
    end
    if numel(idx_neg)<1
        Yc(:,2)=-transpose(sum(transpose(Yct(:,idx_neg))));
    else
        Yc(:,2)=-Yct(:,idx_neg);
    end
    
    Tc=sum(Yc(:));
    ac=size(Yc,2);
    T_Sc=Tc*Tc/ac/n;

    Ac=sum(Yc);
    Sc=sum(Yc');
    A_Sc=sum(Ac.^2)/n;
    S_Sc=sum(Sc.^2)/ac;
    Y_Sc=sum(Yc(:).^2);
    SS_Ac=A_Sc-T_Sc;
    SS_SAc=Y_Sc-A_Sc-S_Sc+T_Sc;
    
    df_Ac=ac-1;
    df_SAc=(ac-1)*(n-1);
    MS_Ac=SS_Ac/df_Ac;
    MS_SAc=SS_SAc/df_SAc;
    Fc=MS_Ac/MS_SAc;
    
    p_comp=1-fcdf(Fc,df_Ac,df_SAc);
    
    conRes{i1}=struct;
    conRes{i1}.names=names;
    conRes{i1}.conVec=conVec;    
    conRes{i1}.SS_Ac=SS_Ac;
    conRes{i1}.SS_SAc=SS_SAc;
    conRes{i1}.MS_Ac=MS_Ac;
    conRes{i1}.MS_SAc=MS_SAc;
    conRes{i1}.df_Ac=df_Ac;
    conRes{i1}.df_SAc=df_SAc;
    conRes{i1}.Fc=Fc;
    conRes{i1}.p=p_comp;
end

%% Post hoc Scheffe
F_thresh_Scheffe=scheffe(df_A,df_SA,alpha,3);
scheffeRes=cell(1,0);
for i1=1:numel(names)
    for i2=i1+1:numel(names)
        conVec=zeros(1,numel(names));
        conVec(i1)=1;
        conVec(i2)=-1;
        
        Yct=X.*repmat(conVec,n,1);
        idx_pos=find(conVec>0);
        idx_neg=find(conVec<0);

        if numel(idx_pos)>1
            Yc(:,1)=transpose(sum(transpose(Yct(:,idx_pos))));
        else
            Yc(:,1)=Yct(:,idx_pos);
        end
        if numel(idx_neg)<1
            Yc(:,2)=-transpose(sum(transpose(Yct(:,idx_neg))));
        else
            Yc(:,2)=-Yct(:,idx_neg);
        end

        Tc=sum(Yc(:));
        ac=size(Yc,2);
        T_Sc=Tc*Tc/ac/n;

        Ac=sum(Yc);
        Sc=sum(Yc');
        A_Sc=sum(Ac.^2)/n;
        S_Sc=sum(Sc.^2)/ac;
        Y_Sc=sum(Yc(:).^2);
        SS_Ac=A_Sc-T_Sc;
        SS_SAc=Y_Sc-A_Sc-S_Sc+T_Sc;

        df_Ac=ac-1;
        df_SAc=(ac-1)*(n-1);
        MS_Ac=SS_Ac/df_Ac;
        MS_SAc=SS_SAc/df_SAc;
        Fc=MS_Ac/MS_SAc;
                
        scheffeRes{end+1}=struct;
        scheffeRes{end}.conVec=conVec;
        scheffeRes{end}.F_thresh_Scheffe=F_thresh_Scheffe;
        scheffeRes{end}.MS_Ac=MS_Ac;
        scheffeRes{end}.MS_SAc=MS_SAc;
        scheffeRes{end}.df_Ac=df_Ac;
        scheffeRes{end}.df_SAc=df_SAc;
        scheffeRes{end}.Fc=Fc;
        scheffeRes{end}.h=Fc>F_thresh_Scheffe;
    end
end

%% Post hoc Tukey HSD
[tukey_q,tukey_diff_thresh]=tukey(df_SA,a,MS_SA,n,alpha);
meanX=mean(X);

tukeyRes=cell(1,0);
for i1=1:numel(names)
    for i2=i1+1:numel(names)
        conVec=zeros(1,numel(names));
        conVec(i1)=1;
        conVec(i2)=-1;
        
        dif=sum(conVec.*meanX);
        
        tukeyRes{end+1}=struct;
        tukeyRes{end}.tukey_q=tukey_q;
        tukeyRes{end}.tukey_diff_thresh=tukey_diff_thresh;
        tukeyRes{end}.conVec=conVec;
        tukeyRes{end}.dif=dif;
        tukeyRes{end}.h=abs(dif)>tukey_diff_thresh;
    end
end

%% Output
if nargout==1
    out=struct;
    out.omniRes=omniRes;
    out.conRes=conRes;
    out.scheffeRes=scheffeRes;
    out.tukeyRes=tukeyRes;
    
    varargout{1}=out;
end

return