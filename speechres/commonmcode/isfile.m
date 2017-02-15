function is = isfile(fileName)
    d = dir(fileName);
    if (length(d) == 0)
        is = 0;
    else
        if d(1).isdir == 1
            is = 0;
        else
            is = 1;
        end
    end
return
