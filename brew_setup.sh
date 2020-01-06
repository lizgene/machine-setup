if [[ ! -x /usr/local/bin/brew ]] ; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap homebrew/versions
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts

brew_packages=(
  autoconf
  autojump
  bash-completion
  dos2unix
  findutils
  git
  git-extras
  gti
  grip
  htop-osx
  markdown
  nodenv
  pkg-config
  python
  rbenv
  rbenv-gemset
  readline
  ruby-build
  ssh-copy-id
  the_silver_searcher
  tig
  tmux
  tree
  trash
  unrar
  vim --with-override-system-vi
  wget
)
brew install ${brew_packages[@]}

# apps
cask_packages=(
  1password
  alfred
  atom
  dash # API documentation browser
  datagrip
  dropbox
  fantastical # best calendar evah
  google-chrome # chrome
  google-chrome-canary # bleeding edge chrome
  nvalt # simple text-based notetaking
  qlcolorcode
  qlimagesize
  qlmarkdown
  quicklook-json
  rescuetime # pomodoro-type app
  rubymine # ruby IDE, requires licensing
  slack
  spectacle # window resizing tool https://www.spectacleapp.com/
  spotify # music
  webpquicklook # https://github.com/sindresorhus/quick-look-plugins
)

brew cask install --force --appdir="/Applications" ${cask_packages[@]}

# Install fonts
brew tap caskroom/fonts

fonts=(
  font-clear-sans
  font-roboto
  font-source-code-pro
  font-inconsolata
  font-hack
)

echo "Installing fonts..."
brew cask install --force ${fonts[@]}

brew cleanup

echo "Initializing rbenv"
rbenv init

echo "Initializing nodenv"
nodenv init
