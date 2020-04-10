#!/bin/bash
# osx_dotfiles install scripts
# by Vito Minheere
# License: GNU GPLv3

# displays a dialog for collecting a single line of text input
# @param $1 the text of the prompt
# @return the input text
function text_dialog() {
	local answer=$(osascript << EOT
		tell application "Finder"
			activate
			set response to text returned of (display dialog "$1" default answer "Response...")
			return response
		end tell
	EOT)

	echo $answer
}

welcomemsg() { \
	text_dialog "Welcome to my Flutter dev setup  Script!\\n\\nThis script will automatically install a fully-featured vscodium development setup, which I use as my main machine for Flutter and Dart projects.\\n\\n-Vito"
	}

flutter_install(){
	local flutter_path="${HOME}/flutter/"
	cd $flutter_path
	git clone https://github.com/flutter/flutter.git -b stable
	flutter precache
	echo "Installed flutter to ${flutter_path}"
	echo "Run flutter doctor to install further"
}

### THE ACTUAL SCRIPT ###

### This is how everything happens in an intuitive format and order.

# Welcome user.
welcomemsg || error "User exited."

# Install x-code commandline tools
xcode-select --install

# Install brew in user home
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
export PATH="$HOME/homebrew/bin:$PATH"

# install Brewfile
brew tap Homebrew/bundle
brew bundle install 

# install pip and virtualenv after Brewfile
pip3 install --user virtualenv

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install Flutter
# flutter_install
