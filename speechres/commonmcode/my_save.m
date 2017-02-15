function mysave(filename,data)
toWrite=0;
if isfile(filename)
    a=input(sprintf('Overwrite %s? (0/1): ',filename));
else
    toWrite=1;
end

if toWrite
    save(filename,data);
end
return