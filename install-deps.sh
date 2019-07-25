# Stop if something fails
set -e

# Ensure we start in the user's home directory
cd ~

#
# Core Installations
#

# Xcode Command Line Tools
# http://osxdaily.com/2014/02/12/install-command-line-tools-mac-os-x/
xcode-select --install

# Install Homebrew
# https://brew.sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install zsh
# Zsh must be listed as a standard shell before we can switch to it.
sudo bash -c 'echo $(which zsh) >> /etc/shells'
chsh -s $(which zsh)

# This must be done before we create a dummy `/Applications/Xcode.app`,
# otherwise `imagemagick` install will error.
# https://github.com/vvo/gifify#requirements
brew install ffmpeg
brew install imagemagick
brew install giflossy
yarn global add gifify

# Disable Spotlight search results for Developer
# https://www.howtogeek.com/231829/how-to-disable-developer-search-results-in-spotlight-on-a-mac/
# https://apple.stackexchange.com/a/181326/31346
# Note this creates an error when running `brew doctor`: "The directory Xcode is reportedly installed to doesn't exist"
touch /Applications/Xcode.app

echo "Open Spotlight preferences and uncheck everything except Applications, Calculator and System Preferences"
read

brew install git

brew install zsh-completions

brew cask install dropbox
echo "Open Dropbox for configuration"
read

brew cask install 1password
echo "Open 1Password, add vaults, and apply license"
read

brew cask install google-chrome
echo "Open Chrome and set up accounts."
read

echo "Set Chrome as default web browser"
read

brew cask install google-backup-and-sync
echo "Open Google Drive for configuration"
read

#
# Credentials
#

# We link individual directories instead of the whole config dir because it
# may include large directories that we don't want to sync, i.e. yarn's node_modules
brew install yarn

# https://github.com/yarnpkg/yarn/issues/630#issuecomment-277837483
mkdir -p ~/.config

ln -sf ~/Google\ Drive/Computer/Dotfiles/.gitconfig
ln -sf ~/Google\ Drive/Computer/Dotfiles/.gitignore
ln -sf ~/Google\ Drive/Computer/Dotfiles/.ssh
ln -sf ~/Google\ Drive/Computer/Dotfiles/.zshrc
ln -sf ~/Google\ Drive/Computer/Dotfiles/.unsplash-env ~/Development/unsplash-web/.env

ln -sf ~/Google\ Drive/Computer/Preferences/VS\ Code/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/Google\ Drive/Computer/Preferences/VS\ Code/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
trash ~/Library/Application\ Support/Code/User/snippets && \
    ln -sf ~/Google\ Drive/Computer/Preferences/VS\ Code/snippets ~/Library/Application\ Support/Code/User/snippets

rm -rf ~/.bash*

echo "Setup Google accounts on Mac for contacts and calendar"
read

brew install zsh-history-substring-search

brew install nvm
# As per `brew info nvm`
mkdir ~/.nvm

nvm install node # "node" is an alias for the latest version

brew install yarn

yarn global add pure-prompt

echo "Open and close terminal"
read

brew cask install iterm2
echo "Sync iTerm2 settings"
read

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
# https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories#comment93718809_22753363
chmod go-w "$(brew --prefix)/share"

brew install hub
echo "Authenticate Hub by attempting to talk to the API (lame)."
read

# brew install gist

brew install z

yarn global add trash-cli

yarn global add is-online-cli

brew install tree

yarn global add diff-so-fancy

brew cask install visual-studio-code

sudo find / -name ".DS_Store" -depth -exec rm {} \;

# https://devcenter.heroku.com/articles/heroku-cli
brew tap heroku/brew
brew install heroku

heroku login

# As per `brew info heroku`
heroku autocomplete --refresh-cache

heroku plugins:install heroku-accounts

heroku accounts:add personal
heroku accounts:add unsplash

brew cask install spectacle
echo "Open and close Spectacle"
read

ln -sf ~/Google\ Drive/Computer/Preferences/Spectacle\ shortcuts.json ~/Library/Application\ Support/Spectacle/Shortcuts.json

echo "Open Spectable, set preferences: shortcuts, launch at login, run as background application"
read

brew install fzf
# As per `brew info fzf`
/usr/local/opt/fzf/install

cd ~/Google\ Drive/Computer/Custom\ scripts
chmod +x ./install.sh
./install.sh
cd -

brew install jq

brew install travis
