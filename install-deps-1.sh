# Stop if something fails
set -e

# Different location because there is no Dropbox yet.
source "lib/colours.sh"

# Ensure we start in the user's home directory
cd ~

#
# Network Configuration
#

echo -e "${green}Configuring network${plain}"

echo "192.168.0.2 nas" | sudo tee -a /etc/hosts

#
# Core Installations
#

echo -e "${green}Installing core${plain}"

sudo xcode-select --install

java

# Install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

# homebrew-cask apps directory
sudo mkdir /opt
# Hide it!
sudo chflags hidden /opt

# Install homebrew-cask for easily installing application binaries
brew tap caskroom/cask
# Betas, etc
brew tap caskroom/versions
brew install brew-cask

brew cask install dash

brew cask install one-password
echo "Open 1Password for configuration"
read
echo "Configure NAS authentication"
read

brew cask install dropbox
echo "Open Dropbox for configuration"
read

brew cask install alfred
echo "Open Alfred Preferences and set sync folder to ~/Dropbox/Preferences/Alfred"
read
echo "Configure Cmd+Space shortcut"
read
brew cask alfred link
echo "Check that linking Alfred worked. If not, DIY."
read

brew cask install sublime-text3

brew cask install google-chrome-canary
echo "Open Chrome and set up accounts for syncing + extensions."
read

brew cask install iterm2-nightly

brew install trash

brew install git

# This inludes a newer version of `rm` command with the `--preserve-root` flag
brew install coreutils

# Install a newer version and one that we can manage
brew install zsh

brew install wget

# Install the latest stable nave the node.js environment switcher Node.js
curl -fsSL https://raw.github.com/isaacs/nave/master/nave.sh > /usr/local/bin/nave && chmod ugo+x /usr/local/bin/nave

# Install a global node.js
nave usemain stable

#
# Dotfiles Setup
#

echo -e "${green}Setting up dotfiles${plain}"

echo "Correct order of paths in /etc/paths, as per http://superuser.com/a/533708/165804"
read

git clone --recursive https://github.com/OliverJAsh/dotfiles.git "${HOME}/.dotfiles"
# Superstition
cd; ~/.dotfiles/setup.sh
cd .dotfiles
git remote set-url origin git@github.com:OliverJAsh/dotfiles.git
git fetch

git clone --recursive https://github.com/OliverJAsh/prezto.git "${HOME}/.zprezto"
git remote rename origin OliverJAsh
git remote add origin git@github.com:sorin-ionescu/prezto.git
git fetch origin

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

#
# Zsh Setup
#

echo -e "${green}Setting up (and installing) Zsh${plain}"

echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/zsh
echo "Install Droid Sans Mono from http://www.fontsquirrel.com/fonts/droid-sans-mono"
read
echo "Set iTerm to load preferences from /Users/Oliver/Dropbox/Preferences"
read
echo "Close and re-open terminal"

# Continued in `install-deps-2.sh`
