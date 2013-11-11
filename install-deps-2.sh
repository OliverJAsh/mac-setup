# Stop if something fails
set -e

source "$HOME/Dropbox/Scripts/Setup/lib/colours.sh"

#
# Continued Zsh setup
#

echo "Check that the fonts are set correctly (regular and non-ASCII)"
read

# Standard Prezto install script, as per: https://github.com/sorin-ionescu/prezto
git clone --recursive git@github.com:OliverJAsh/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N)
do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

rm -rf .bash*

#
# Sublime Text settings
#

echo -e "${green}Setting up Sublime Text${plain}"

echo "Open Sublime Text to create initial library files."
read

cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/

trash ./User
git clone git@github.com:OliverJAsh/sublime-text-settings ./User

echo "Install Package Control: https://sublime.wbond.net/installation"
read

echo "Install DejaVu Sans Mono from http://dejavu-fonts.org/wiki/Download"
read

echo "Provide license"
read

git clone git@github.com:SublimeLinter/SublimeLinter.git
cd SublimeLinter
git checkout sublime-text-3
hub merge https://github.com/SublimeLinter/SublimeLinter/pull/447

cd -

#
# Additional Installations
#

echo -e "${green}Running additional installations${plain}"

brew install hub
echo "Authenticate Hub by attempting to talk to the API (lame)."
read

brew install gist
gist --login

brew cask install xld
echo "Configure XLD to output as Apple Lossless and to NAS"
read

brew cask install rdio
echo "Login to Rdio"
read

brew install z
# FIXME: Needed for Mavericks
brew install --devel mongodb
brew install youtube-dl

brew cask install knock
echo "Setup Knock to Unlock"
read

sudo gem install airplayer
sudo gem install compass

sudo npm install -g grunt-cli bower http-server

#
# Manual work
#

echo -e "${green}Now it's time to get *your* hands dirty!${plain}"

echo "Install apps in Mac App Store"
read

echo "Add iTunes and Aperture(?) to Spotlight ignore list"
read

# Divvy
ln -s ~/Dropbox/Preferences/com.mizage.Divvy.plist ~/Library/Preferences/com.mizage.Divvy.plist

# TODO: keep?
# sudo xcodebuild -license
