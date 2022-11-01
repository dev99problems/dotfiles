# Installing plugins

Three main plugins, that you're using:
* [z](https://github.com/rupa/z)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md)
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)


## z

Needed for fast jumping all around
There are different variations of this, but you always can use the one in `z.sh`, like
`ln -s <path_to_repo>/.dotfiles/zsh/z.sh ~/.z.sh`


## zsh-syntax-highlighting 

It's already enabled in `.zshrc`, so it's should be only installed, via:
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`


### zsh-autosuggestions

The same for this one — it's already configured, need just to be installed:
`git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
```
