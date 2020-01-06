if [[ ! -x /usr/local/bin/brew ]] ; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/versions
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts

brew_packages=(
  bash-completion
  git
  git-extras
  gti
  asdf
  rbenv
  rbenv-gemset
  readline
  the_silver_searcher
  tmux
  vim --with-override-system-vi
  wget
  docker
)
brew install ${brew_packages[@]}

# apps
cask_packages=(
  1password
  atom
  datagrip
  dropbox
  nvalt # simple text-based notetaking
  rubymine # ruby IDE, requires licensing
  spectacle # window resizing tool https://www.spectacleapp.com/
  spotify
  iterm2
)

brew cask install --force --appdir="/Applications" ${cask_packages[@]}

brew cleanup

echo "Initializing rbenv"
rbenv init
