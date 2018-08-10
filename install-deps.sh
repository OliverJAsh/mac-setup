# Stop if something fails
set -e

# Ensure we start in the user's home directory
cd ~

#
# Core Installations
#

sudo xcode-select --install

# Disable Spotlight search results for Developer
# https://www.howtogeek.com/231829/how-to-disable-developer-search-results-in-spotlight-on-a-mac/
touch /Applications/Xcode.app

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
ln -sf ~/Google\ Drive/Computer/Dotfiles/.config/hub ~/.config/hub

ln -sf ~/Google\ Drive/Computer/Dotfiles/.aws
ln -sf ~/Google\ Drive/Computer/Dotfiles/.editorconfig
ln -sf ~/Google\ Drive/Computer/Dotfiles/.gist
ln -sf ~/Google\ Drive/Computer/Dotfiles/.gitconfig
ln -sf ~/Google\ Drive/Computer/Dotfiles/.gitignore
ln -sf ~/Google\ Drive/Computer/Dotfiles/.s3cfg
ln -sf ~/Google\ Drive/Computer/Dotfiles/.ssh
ln -sf ~/Google\ Drive/Computer/Dotfiles/.zshrc

ln -sf ~/Desktop/Custom\ commands/git-browse-commit /usr/local/bin/git-browse-commit
ln -sf ~/Desktop/Custom\ commands/_git-browse-commit /usr/local/share/zsh/site-functions/_git-browse-commit

ln -sf ~/Desktop/Custom\ commands/git-pr-clean /usr/local/bin/git-pr-clean
ln -sf ~/Desktop/Custom\ commands/_git-pr-clean /usr/local/share/zsh/site-functions/_git-pr-clean

ln -sf ~/Desktop/Custom\ commands/git-rm-branch /usr/local/bin/git-rm-branch
ln -sf ~/Desktop/Custom\ commands/_git-rm-branch /usr/local/share/zsh/site-functions/_git-rm-branch

ln -sf ~/Desktop/Custom\ commands/git-stash-staged /usr/local/bin/git-stash-staged
ln -sf ~/Desktop/Custom\ commands/_git-stash-staged /usr/local/share/zsh/site-functions/_git-stash-staged

ln -sf ~/Desktop/Custom\ commands/git-pr-merge-and-clean /usr/local/bin/git-pr-merge-and-clean
ln -sf ~/Desktop/Custom\ commands/_git-pr-merge-and-clean /usr/local/share/zsh/site-functions/_git-pr-merge-and-clean

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

rm -rf .bash*

brew install hub
echo "Authenticate Hub by attempting to talk to the API (lame)."
read

brew install gist

brew install z

echo "Apply license for 1Password"
read

npm install -g trash

brew install tree

# JDK -> JRE -> JVM
brew cask install java

npm install -g diff-so-fancy

brew cask install visual-studio-code

sudo find / -name ".DS_Store" -depth -exec rm {} \;

brew install awscli
brew install s3cmd

# ghead -n-1 etc.
brew install coreutils

# adb, screen recording etc
brew install android-platform-tools
brew cask install android-file-transfer

brew install heroku

heroku plugins:install autocomplete
heroku plugins:install heroku-accounts

brew install yarn --without-node

# scutil --get HostName
# Check it is Olivers-MBP, if not set:
# scutil --set HostName Olivers-MBP
