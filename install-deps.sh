# Stop if something fails
set -e

# Ensure we start in the user's home directory
cd ~

#
# Core Installations
#

sudo xcode-select --install

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install git

# Install homebrew-cask for easily installing application binaries
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew install caskroom/cask/brew-cask
# ST3
brew tap caskroom/versions

brew cask install dropbox
echo "Open Dropbox for configuration"
read

brew cask install 1password
echo "Open 1Password for configuration and apply license"
read

brew cask install sublime-text-dev

brew cask install google-chrome
brew cask install google-chrome-canary
echo "Open Chrome and set up accounts for syncing + extensions."
read

brew cask install google-drive
echo "Open Google Drive for configuration"
read

brew install zsh
sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
chsh -s /usr/local/bin/zsh

ln -s ~/Google\ Drive/Dotfiles/.gitconfig
ln -s ~/Google\ Drive/Dotfiles/.ssh
ln -s ~/Google\ Drive/Dotfiles/.zshrc

echo "Setup Google accounts on Mac"
read

brew install zsh-history-substring-search

# Install the latest stable nave the node.js environment switcher Node.js
curl -fsSL https://raw.github.com/isaacs/nave/master/nave.sh > /usr/local/bin/nave && chmod ugo+x /usr/local/bin/nave

# Install a global node.js
nave usemain stable

npm install --global pure-prompt

echo "Open and close terminal"
read

brew cask install iterm2-nightly
echo "Sync iTerm2 settings"
read

echo "Install iTerm2 theme (base16-chalk and Tomorrow Night Eighties): https://github.com/chriskempson/base16-iterm2; https://github.com/chriskempson/tomorrow-theme/tree/master/iTerm2"
echo "Install Terminal theme (Tomorrow Night Eighties): https://github.com/chriskempson/tomorrow-theme/tree/master/OS%20X%20Terminal"

brew tap caskroom/fonts

brew cask install font-source-code-pro

git clone git@github.com:OliverJAsh/st.git ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
npm install --global jshint

echo "Open Sublime for configuration, and install Package Control"
read

rm -rf .bash*

#
# Sublime Text settings
#

brew install hub
echo "Authenticate Hub by attempting to talk to the API (lame)."
read

hub clone OliverJAsh/st ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
echo "Open Sublime Text and install Package Control"
read

brew install gist
gist --login

brew install z

brew cask install kaleidoscope
echo "Apply license for Kaleidoscope and switch on intergration"
read

brew install rbenv
brew install ruby-build
rbenv install --list
echo "Install Ruby version, then "rbenv global <x>""
read

npm install -g trash
# JDK -> JRE -> JVM
brew cask install java
