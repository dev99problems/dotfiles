# .dotfiles
Personal dot and "not that dot" files and configs 

## Configs

This is saved as a reminder.
The bigger part of this is now done by `setup.sh`.

### zshrc

```bash
# alias
ln -s ~/reps/github/.dotfiles/zsh/z.sh ~/.z.sh
ln -s ~/reps/github/.dotfiles/zsh/.zshrc ~/.zshrc
```


### kitty

```bash
# alias
cp ~/reps/github/.dotfiles/kitty/dracula.conf ~/.config/kitty/dracula.conf
cp ~/reps/github/.dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
```


### nnn

```bash
# After setting up .zshrc and installing `nnn`, there's a need to add 
# plugins, so the commited plugins folder can be just aliased
ln -s ~/reps/github/.dotfiles/nnn/plugins ~/.config/nnn/
```


### nvim

```bash
# alias
ln -s ~/reps/github/.dotfiles/nvim/.config/nvim/ ~/.config/nvim
```


### tmux

```bash
# 1. Firstly you need to copy the config
# alias
ln -s ~/reps/github/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

# 2. After that you need to install `tmp` - tmux plugin manager.
# More details at https://github.com/tmux-plugins/tpm#installation
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# 3. Reload the config and install plugins
tmux source ~/.tmux.conf
# Hit <Prefix>I - this will do the magic

# 4. Sometimes after installing tmux using `brew`,
# I need to adjust the colors for Kitty. More details in `.dotfiles/tmux/`
```


### git

```bash
# alias
ln -s ~/reps/github/.dotfiles/git/.gitconfig ~/.gitconfig
```


### gitextras

```bash
# alias
ln -s ~/reps/github/.dotfiles/git_extras ~/.git_extras
```


### gitui

```bash
# To have nvim keybindings in gitui, connect the config
ln -s ~/reps/github/.dotfiles/gitui/key_bindings.ron ~/.config/gitui/key_bindings.ron
```



