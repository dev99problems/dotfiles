
#/bin/bash
#
# This should help prepare for `detaching` of configured
# linked configs

echo "zsh: detaching"
# rm ~/.z.sh
rm ~/.zshrc 

echo "kitty: detaching"
rm ~/.config/kitty/dracula.conf
rm ~/.config/kitty/kitty.conf

echo "nnn: detaching"
rm -rf ~/.config/nnn/plugins

echo "nvim: detaching"
rm -rf ~/.config/nvim

echo "tmux: detaching"
rm ~/.tmux.conf

echo "git: detaching"
rm ~/.gitconfig

echo "git-extras: detaching"
rm -rf ~/.git_extras

echo "gitui: detaching"
rm ~/.config/gitui/key_bindings.ron
rm ~/.config/gitui/theme.ron
