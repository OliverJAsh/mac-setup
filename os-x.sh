# Finder preferences:
# - hide all items from desktop
# - set new windows to show home folder
# - hide everything from sidebar except:
# - - Applications
# - - Desktop
# - - Downloads
# - - home
# - - Hard disks
# - show all filename extensions

# Menu bar
# - Battery: show percentage

# System preferences
# - Enable full keyboard access for all controls
# - Enable scroll gesture with modifier key to zoom
# - Show bluetooth in menu bar
# - Show date in menu bar
# - Show volume in menu bar
# - Configure Time Machine (disk, excluded)
# - Configure keyboard backlight to turn off after 5 seconds of inactivity
# - Software update -> automatically keep my Mac up to date

# Disable shadow in screenshots
# https://www.macgasm.net/2011/05/23/disable-dropshadow-mac-os-window-screenshots/
defaults write com.apple.screencapture disable-shadow -bool true
killall SystemUIServer

# Remove all apps from dock
# http://krypted.com/mac-security/remove-all-apps-from-the-dock-in-os-x/
defaults write com.apple.dock persistent-apps -array
# Remove all folders from dock
defaults write com.apple.dock persistent-others -array
killall Dock

echo "Set user avatar"
read
