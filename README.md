## These are my twisted words
This is my personal vim configuration, with pathogen as the plugin manager.  
It's been going through an overhaul and some things are broken.  

Notably I'd like to add:
- whitespace highlighting through `airline`, it's not functional right now
- more, but I can't remember. I have a hectic life.

I place this git repo as my `~/.vim/`  
The vimrc is included (and somewhat commented well, I think, maybe) of course, and you'll want to symlink in your home dir:
```sh
cd ~
ln -s .vim/vimrc .vimrc
```

All plugins are added as git submodules, so you'll need to pull them like so:
```sh
git submodule init
git submodule update
```
