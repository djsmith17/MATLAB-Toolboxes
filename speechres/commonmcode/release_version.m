function rv=release_version()
a=ver;
rv=strrep(strrep(a(1).Release,'(',''),')','');

return