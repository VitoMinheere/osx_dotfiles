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

### THE ACTUAL SCRIPT ###

### This is how everything happens in an intuitive format and order.

# Welcome user.
welcomemsg || error "User exited."

