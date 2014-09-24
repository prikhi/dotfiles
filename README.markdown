## Instructions
### Creating source files
Any file which matches the shell glob `_*` will be linked into `$HOME` as a symlink with the first `_`  replaced with a `.`

For example:

    _zshrc

becomes

    ${HOME}/.zshrc

### Installing source files
It's as simple as running:

    ./install.sh

From this top-level directory.

### Only install and build vim Files
Because this bit is pretty portable

    ./install.sh vim

### Restore old source Files
To replace installed files with the originals:

    ./install.sh restore

Note that if there was not an original version, the installed links will not be removed.

## Requirements
### Shell
* zsh

### Vim
* python
  * pep8
  * pylint
* haskell
  * hlint
