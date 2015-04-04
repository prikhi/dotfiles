 " don't fold if there are no heaaders (default.nix files)
if search('###','nw') > 0
    setlocal foldexpr=getline(v:lnum)=~'###'?'>1':1
    setlocal foldmethod=expr
    setlocal foldtext=getline(v:foldstart)
endif

setlocal sw=2
