#!/bin/sh
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gemrc ~/.gemrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tigrc ~/.tigrc
ln -sf ~/dotfiles/.zshrc.custom ~/.zshrc.custom
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/fish
ln -sf ~/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish

ln -sf ~/dotfiles/hammerspoon/init.lua ~/.hammerspoon/init.lua

ln -sf ~/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
ln -sf ~/dotfiles/.config/karabiner/assets/complex_modifications/dynalist.json ~/.config/karabiner/assets/complex_modifications/dynalist.json
ln -sf ~/dotfiles/.config/karabiner/assets/complex_modifications/slack.json ~/.config/karabiner/assets/complex_modifications/slack.json
