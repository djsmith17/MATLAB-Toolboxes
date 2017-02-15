% my_rmanova_1fact: Repeated-measures ANOVA with one independent variable.
% 
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: 2009-06-05

function [F_A,df_A,df_AxS,p_F,varargout]=my_rmanova_1fact(tab,varargin)
marginA=sum(tab);
marginS=sum(transpose(tab));
br_A=sum(marginA.^2)/size(tab,1);
br_S=sum(marginS.^2)/size(tab,2);
br_Y=sum(tab(:).^2);
br_T=sum(tab(:))^2/(size(tab,1)*size(tab,2));
ss_A=br_A-br_T;
ss_S=br_S-br_T;
ss_AxS=br_Y-br_A-br_S+br_T;
df_A=size(tab,2)-1;
df_S=size(tab,1)-1;
df_AxS=(size(tab,2)-1)*(size(tab,1)-1);
ms_A=ss_A/df_A;
ms_S=ss_S/df_S;
ms_AxS=ss_AxS/df_AxS;
F_A=ms_A/ms_AxS;

p_F=1-fcdf(F_A,df_A,df_AxS);

%% Post-hoc comparisons
if ~isempty(varargin)
    AS=[];
    comp_coeff=varargin{1};
    idx_pos=find(comp_coeff>0);
    idx_neg=find(comp_coeff<0);   
    tab_pos=tab(:,idx_pos);
    tab_neg=tab(:,idx_neg);
    for i1=1:size(tab_pos,1)
        tab_pos(i1,:)=tab_pos(i1,:).*comp_coeff(idx_pos);
    end
    for i1=1:size(tab_neg,1)
        tab_neg(i1,:)=-tab_neg(i1,:).*comp_coeff(idx_neg);
    end
    
    if size(tab_pos,2)>1
        AS(:,1)=sum(tab_pos');
    else
        AS(:,1)=tab_pos;
    end
    if size(tab_neg,2)>1 
        AS(:,2)=sum(tab_neg');
    else
        AS(:,2)=tab_neg;
    end
    df_comp_A=size(AS,2)-1;
    df_comp_AxS=df_comp_A*df_S;
    comp_br_T=sum(AS(:))^2/(size(AS,1)*size(AS,2));
    comp_br_A=sum(sum(AS).^2)/size(AS,1);
    comp_br_S=sum(sum(transpose(AS)).^2)/size(AS,2);
    comp_br_Y=sum(AS(:).^2);
    comp_ss_A=(comp_br_A-comp_br_T);
    comp_ss_S=comp_br_S-comp_br_T;
    comp_ss_AxS=(comp_br_Y-comp_br_A-comp_br_S+comp_br_T);
    comp_ms_A=comp_ss_A/df_comp_A;
    comp_ms_S=comp_ss_S/df_S;
    comp_ms_AxS=comp_ss_AxS/df_comp_AxS;
    F_comp=comp_ms_A/comp_ms_AxS;
    p_comp=1-fcdf(F_comp,df_comp_A,df_comp_AxS);
    
    compRes.F_comp=F_comp;
    compRes.df_comp_A=df_comp_A;
    compRes.df_comp_AxS=df_comp_AxS;
    compRes.p_comp=p_comp;
    
    varargout{1}=compRes;
end
return
