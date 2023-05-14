#/bin/bash
#
# This file should auto-link all the dotfiles 
# to their proper places in the filestystem

CURRENT_DIR=$(pwd)
echo "zsh: linking config & plugins"
ln -s ${CURRENT_DIR}/zsh/z.sh ~/.z.sh
# TODO: rename file
ln -s ${CURRENT_DIR}/zsh/.zshrc ~/.zshrc 

echo "kitty: linking config & theme"
ln -s ${CURRENT_DIR}/kitty/dracula.conf ~/.config/kitty/dracula.conf
ln -s ${CURRENT_DIR}/kitty/kitty.conf ~/.config/kitty/kitty.conf

echo "nnn: linking plugins"
ln -s ${CURRENT_DIR}/nnn/plugins ~/.config/nnn/

echo "nvim: linking config"
ln -s ${CURRENT_DIR}/nvim/.config/nvim ~/.config/nvim

echo "tmux: linking config"
# TODO: rename file from .tmux.conf to tmux.conf
ln -s ${CURRENT_DIR}/tmux/.tmux.conf ~/.tmux.conf

echo "git: linking config"
# TODO: rename file from .gitconfig to gitconfig
ln -s ${CURRENT_DIR}/git/.gitconfig ~/.gitconfig

echo "git-extras: linking config"
ln -s ${CURRENT_DIR}/git_extras ~/.git_extras

echo "gitui: linking theme & keybindings"
ln -s ${CURRENT_DIR}/gitui/key_bindings.ron ~/.config/gitui/key_bindings.ron
ln -s ${CURRENT_DIR}/gitui/theme.ron ~/.config/gitui/theme.ron
