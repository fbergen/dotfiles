echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo "Show Path bar in Finder"
defaults write com.apple.finder ShowPathbar -bool true

echo "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# echo "Require password immediately after sleep or screen saver begins"
# defaults write com.apple.screensaver askForPassword -int 1
# defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Save screenshots to the desktop"
mkdir -p $HOME/Desktop/screenshots
defaults write com.apple.screencapture location -string "$HOME/Desktop/screenshots"

export AWS_ID=AKIAITR3KX6T53FBHV5A
export AWS_KEY=2rKSjg2jnj3C0iS/RZ+TuymPmGdeAf+zg8zl7aUy

echo "Kill affected applications"
for app in Finder Dock SystemUIServer; do killall "$app" >/dev/null 2>&1; done
