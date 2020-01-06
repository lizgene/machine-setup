#!/usr/bin/env bash

# Install Command Line Tools without Xcode
xcode-select --install

echo "Checking for updates..."
softwareupdate --install --all

echo "Setting OSX Defaults..."
./osx_defaults.sh

mkdir ~/.tmp
mkdir ~/code
mkdir ~/code/work
ln -sfn "$(pwd -P)" ~/
ln -sfn "$(pwd)/dotfiles/.bash_profile" ~
ln -sfn "$(pwd)/dotfiles/.gitconfig" ~
ln -sfn "$(pwd)/dotfiles/.gitignore" ~
ln -sfn "$(pwd)/dotfiles/.gemrc" ~
ln -sfn "$(pwd)/dotfiles/.editorconfig" ~

# vim
ln -sfn "$(pwd)/.vim" ~
ln -sfn "$(pwd)/.vim/.vimrc" ~
mkdir ~/.vim/tmp

git submodule init
git submodule update --remote --rebase

echo "Installing brew and brew cask packages..."
./brew_setup.sh

exit 0
