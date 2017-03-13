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

# Use zsh's built-in completions, i.e. /usr/local/Cellar/zsh/<version>/share/zsh/functions/_git
brew install --without-completions git
brew install zsh-completions

# Install homebrew-cask for easily installing application binaries
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
brew tap caskroom/cask
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
brew cask install google-chrome-dev
echo "Open Chrome and set up accounts for syncing + extensions."
read

echo "Set Google Chrome Dev as default web browser"
read

brew cask install google-drive
echo "Open Google Drive for configuration"
read

brew install zsh
sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
chsh -s /usr/local/bin/zsh

# hub, heroku credentials, etc.
# ln -sf ~/Google\ Drive/Computer/Dotfiles/.config
# We link individual directories instead of the whole config dir because it
# may include large directories that we don't want to sync, i.e. yarn's node_modules
# https://github.com/yarnpkg/yarn/issues/630#issuecomment-277837483
mkdir -p ~/.config
ln -sf ~/Google\ Drive/Computer/Dotfiles/.config/configstore ~/.config/configstore
ln -sf ~/Google\ Drive/Computer/Dotfiles/.config/git ~/.config/git
ln -sf ~/Google\ Drive/Computer/Dotfiles/.config/heroku ~/.config/heroku
ln -sf ~/Google\ Drive/Computer/Dotfiles/.config/hub ~/.config/hub
ln -sf ~/Google\ Drive/Computer/Dotfiles/.config/menus ~/.config/menus
# gist credentials
ln -sf ~/Google\ Drive/Computer/Dotfiles/.gist
ln -sf ~/Google\ Drive/Computer/Dotfiles/.editorconfig
ln -sf ~/Google\ Drive/Computer/Dotfiles/.gitconfig
ln -sf ~/Google\ Drive/Computer/Dotfiles/.gitignore
ln -sf ~/Google\ Drive/Computer/Dotfiles/.ssh
ln -sf ~/Google\ Drive/Computer/Dotfiles/.zshrc
ln -sf ~/Google\ Drive/Computer/Dotfiles/.zprofile
ln -sf ~/Google\ Drive/Computer/Dotfiles/.mongorc.js
ln -sf ~/Google\ Drive/Computer/Dotfiles/.eslintrc

ln -sf ~/Desktop/Custom\ commands/git-merge-pr /usr/local/bin/git-merge-pr
ln -sf ~/Desktop/Custom\ commands/git-browse-pr /usr/local/bin/git-browse-pr
ln -sf ~/Desktop/Custom\ commands/_git-merge-pr /usr/local/share/zsh/site-functions/_git_merge-pr

echo "Setup Google accounts on Mac"
read

brew install zsh-history-substring-search

brew install nvm
mkdir ~/.nvm

nvm install stable
nvm alias default stable

npm install --global pure-prompt

echo "Open and close terminal"
read

brew cask install iterm2-nightly
echo "Sync iTerm2 settings"
read

brew tap caskroom/fonts

brew cask install font-source-code-pro
brew cask install font-didact-gothic

git clone git@github.com:OliverJAsh/st.git ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

echo "Open Sublime for configuration, and install Package Control"
read

rm -rf .bash*

#
# Sublime Text settings
#

brew install hub
echo "Authenticate Hub by attempting to talk to the API (lame)."
read

brew install gist

brew install z

brew cask install kaleidoscope
echo "Apply license for Kaleidoscope and switch on intergration"
read

echo "Apply license for 1Password"
read

brew install rbenv
brew install ruby-build
rbenv install --list
# rbenv install x
echo "Install Ruby version, then "rbenv global <x>""
read

# rbenv local x

gem install bundler

npm install -g trash

brew install tree

# JDK -> JRE -> JVM
brew cask install java

brew cask install intellij-idea

npm install -g diff-so-fancy

brew cask install visual-studio-code

sudo find / -name ".DS_Store" -depth -exec rm {} \;

brew install awscli
brew install s3cmd

brew install zsh-completions

brew cask install colorpicker-skalacolor

# ghead -n-1 etc.
brew install coreutils

# adb, screen recording etc
brew install android-platform-tools 
brew cask install android-file-transfer
