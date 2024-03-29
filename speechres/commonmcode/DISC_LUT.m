function r=DISC_LUT(phone)
LUT={   'f','f';...
        'p','p';...
        'h','h';...
        's','s';...
        't','t';...
        'd','d';...
        'b','b';...
        'ah','#';...
        'a','#';...
        'ee','i';...
        'i','i';...
        'oo','u';...
        'u','u';...
        'eh','E';...
        'ou','5';...
        'o','5';...
        'ai','2';...
        'ei','1'};
    
r=[];
for i1=1:size(LUT,1)
    if isequal(LUT{i1,1},phone)
        r=LUT{i1,2};
        return
    end
end
return