#!/bin/bash
# osx_dotfiles install scripts
# by Vito Minheere
# License: GNU GPLv3

error() { clear; printf "ERROR:\\n%s\\n" "$1"; exit;}

is_admin() { 
	if id -Gn $1 | grep -q -w admin;
	then
		echo "User is admin"
	else
		error "You are not an admin"
	fi
	}

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
	text_dialog "Welcome to my osx_dotfiles install Script!\\n\\nThis script will automatically install a fully-featured vscodium development setup, which I use as my main machine for Flutter and Dart projects.\\n This script should be run as admin as it will install files in /Applications \\n \\n-Vito"
	}

copy_git(){
	cd $HOME
	git init .
	git remote add origin https://github.com/VitoMinheere/osx_dotfiles.git
	git pull origin master
}

flutter_install(){
	local flutter_path="${HOME}/flutter/"
	mkdir -p $ flutter_path
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

# Check if user is admin
is_admin 

# Install x-code commandline tools
xcode-select --install

# Copy git repo into home directory
copy_git || error "Something went wrong when cloning repo"

# Install brew in user home
mkdir -p $HOME/homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
echo 'export PATH="$HOME/homebrew/bin:$PATH"' >> $HOME/.profile

# install Brewfile
brew tap Homebrew/bundle
brew bundle 

# install pip and virtualenv after Brewfile
pip3 install --user virtualenv

# Install Oh My Zsh
[ ! -f ".zshrc" ] && sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install Flutter
[ ! -f "flutter" ] && flutter_install

# Create personal folders
mkdir -p $HOME/Developer

# Done
echo "Install done, please sign out and sign in to see changes"
