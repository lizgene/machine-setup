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
ln -sfn "$(pwd)/.bash_profile" ~
ln -sfn "$(pwd)/.gitconfig" ~
ln -sfn "$(pwd)/.gitignore" ~
ln -sfn "$(pwd)/.gitattributes" ~
ln -sfn "$(pwd)/.bash-it" ~
ln -sfn "$(pwd)/.inputrc" ~
ln -sfn "$(pwd)/.gemrc" ~
ln -sfn "$(pwd)/.editorconfig" ~

# vim
ln -sfn "$(pwd)/.vim" ~
ln -sfn "$(pwd)/.vim/.vimrc" ~
mkdir ~/.vim/tmp

git submodule init
git submodule update --remote --rebase

echo "Installing brew and brew cask packages..."
./brew_setup.sh

exit 0
