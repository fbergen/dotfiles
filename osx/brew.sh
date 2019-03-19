# Homebrew.
# - inspired by https://github.com/mathiasbynens/dotfiles/blob/master/brew.sh

sudo -v
# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

brew install cmake

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install bash completion
brew install bash-completion

# Python
brew install python3
brew install python2

# Vim
brew install vim
brew install neovim

brew install grep
brew install openssh

brew install htop
brew install tmux
brew install ack
brew install git
brew install go
brew install jq

brew install pass
# connect tmux to the OS X clipboard service.
brew install reattach-to-user-namespace

brew update
brew install watchman

# Iterm2
brew cask install iterm2

# java jdk
brew cask install java
brew cask install android-platform-tools

# Other cask utils
brew cask install karabiner-elements

brew cleanup
