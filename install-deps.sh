# Stop if something fails
set -e

# Ensure we start in the user's home directory
cd ~

code --list-extensions > vs_code_extensions_list.txt

# Create backups
echo "Backup ~/Development, ~/Pictures, vs_code_extensions_list.txt"
read

echo "Restore backups to new machine"
read

#
# Core Installations
#

echo "Install Xcode"
read

# Install Homebrew
# https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install zsh
# Zsh must be listed as a standard shell before we can switch to it.
sudo bash -c 'echo $(which zsh) >> /etc/shells'
chsh -s $(which zsh)

brew install git

brew install zsh-completions

brew install --cask dropbox
echo "Open Dropbox for configuration"
read

brew install --cask 1password
echo "Open 1Password, add vaults, and apply license"
read

brew install --cask google-chrome
echo "Open Chrome and set up accounts."
read

echo "Set Chrome as default web browser"
read

brew install --cask google-drive
echo "Open Google Drive for configuration"
read

#
# Credentials
#

# We link individual directories instead of the whole config dir because it
# may include large directories that we don't want to sync, i.e. yarn's node_modules

# https://github.com/yarnpkg/yarn/issues/630#issuecomment-277837483
mkdir -p ~/.config

ln -sf ~/Google\ Drive/My\ Drive/Computer/Dotfiles/.gitconfig
ln -sf ~/Google\ Drive/My\ Drive/Computer/Dotfiles/.gitignore
ln -sf ~/Google\ Drive/My\ Drive/Computer/Dotfiles/.ssh
ln -sf ~/Google\ Drive/My\ Drive/Computer/Dotfiles/.zshrc
ln -sf ~/Google\ Drive/My\ Drive/Computer/Dotfiles/.gist
ln -sf ~/Google\ Drive/My\ Drive/Computer/Dotfiles/.unsplash-web-env ~/Development/unsplash-web/.env
ln -sf ~/Google\ Drive/My\ Drive/Computer/Dotfiles/.config/hub ~/.config/hub

echo "Setup Google accounts on Mac for contacts and calendar"
read

brew install zsh-history-substring-search

brew install nvm

nvm install node # "node" is an alias for the latest version

brew install yarn

yarn global add pure-prompt

echo "Open and close terminal"
read

brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono

brew install --cask iterm2
echo "Sync iTerm2 settings"
read

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
# https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories#comment93718809_22753363
chmod go-w "$(brew --prefix)/share"

brew install z

yarn global add trash-cli

yarn global add is-online-cli

brew install tree

brew install git-delta

brew install --cask visual-studio-code

echo "Open and Close VS Code"
read

ln -sf ~/Google\ Drive/My\ Drive/Computer/Preferences/VS\ Code/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/Google\ Drive/My\ Drive/Computer/Preferences/VS\ Code/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
trash ~/Library/Application\ Support/Code/User/snippets && \
    ln -sf ~/Google\ Drive/My\ Drive/Computer/Preferences/VS\ Code/snippets ~/Library/Application\ Support/Code/User/snippets

cat ~/vs_code_extensions_list.txt | xargs -n 1 code --install-extension
trash vs_code_extensions_list.txt

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

brew install --cask spectacle
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

brew install --cask spotify

echo "Open Spotify and login"
read

yarn global add yarn-deduplicate

yarn global add np

npm login

brew install --cask zoom
echo "Open Zoom, login"
read

ln -sf ~/Google\ Drive/My\ Drive/Computer/Preferences/lazygit/config.yml /Users/oliverash/Library/Application\ Support/lazygit/config.yml

brew install lazygit

brew install --cask slack
