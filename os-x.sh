echo "Set setting: System Preferences > Security & Privacy > General > Allow apps to be downloaded from: Anywhere"
read

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
killall Finder

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Don’t show Dashboard as a Space
# defaults write com.apple.dock dashboard-in-overlay -bool true

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Use scroll gesture with the Ctrl (^) modifier key to zoom
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess closeViewSmoothImages -int 0

# Don't create .DS_Store files on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

defaults write com.apple.dock showAppExposeGestureEnabled -bool true

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -bool false
defaults write com.apple.AppleBluetoothMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleBluetoothMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -bool false
defaults write com.apple.AppleBluetoothMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -bool false

defaults write "Apple Global Domain" AppleAquaColorVariant -int 6
defaults write "Apple Global Domain" AppleInterfaceStyle -string "Dark"

# defaults read com.apple.finder DesktopViewSettings IconViewSettings arrangeBy

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
# PfHm for home
defaults write com.apple.finder NewWindowTarget -string "PfHm”
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/“

defaults write com.apple.dock persistent-apps -array

# Show date
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  HH:mm"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# TODO: set default browser

killall SystemUIServer
echo "Done. Note that some of these changes require a logout/restart to take effect."

#
# Manual
#

echo "Set user avatar"
read
