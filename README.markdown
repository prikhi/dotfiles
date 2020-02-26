## Instructions
### Creating source files
Add files/folders to the base directory and modify `config.yaml` to reflect the
desired symlink mapping. Keep any custom shell commands idempotent.

### Installing source files
It's as simple as running:

    ./install.sh

From this top-level directory.


## Requirements
### Shell
* zsh

### Neovim/Vim
* python
  * pep8
  * pylint
* elm
  * elm-language-server
  * elm-analyse
  * elm-format
* haskell
  * haskell-ide-engine
* neovim-qt

### X
* Awesome Window Manager
* Obsidian xcursor theme
* Clearlooks Phenix gtk theme

# Services

You should enable & start these services using systemd user sessions:

* mpd
* mpdscribble
