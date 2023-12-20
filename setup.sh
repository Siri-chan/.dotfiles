#!/bin/bash

printf "This script depends on charm.sh gum. 
The script will now attempt to detect it, and start proper."

if hash gum &>/dev/null; then 
	clear
else
	printf "This program depends on gum <https://github.com/charmbracelet/gum#installation>. Please install it."
fi

stringContains() { 
	case $2 in 
		*$1*) return 0;; 
		*) return 1;; 
	esac 
}

mkdir -p /tmp/siri

printf "# Siri's Config Files
This is a collection of my linux dotfiles, with \
a convenient and automated installer script.
Please double check that this script is running in a bash-compatible shell.
(_It should use \`bash\` by default if it is installed_)\n
## Configuration
The next step will prompt you for a list of programs, for which config files can be installed. 
Each of these programs have their own directory in this repo, and within that directory, \
a readme file, that YOU SHOULD READ.
If you don't understand markdown, and need pretty formatting, just run the following command while in this repository:

\`\`\`sh
	cat ./**/README.md | gum format | gum pager
\`\`\`

Confirmation of the following prompt will proceed to autodetect dependencies \
to determine which configurations can be installed.
If you do not see a configuration setup on the list, \
check it's readme for any additional dependencies,
and ensure you have both those, and the program itself installed.

---
" > /tmp/siri/notice.md

printf "# Confirmation\n
I understand that the files I am installing fall under the license included with this repository, 
and I consent for this script to make changes to my system.\
" > /tmp/siri/confirm.md

gum format < /tmp/siri/notice.md # | gum pager

CONFIRM=$(gum format < /tmp/siri/confirm.md)
if gum confirm "$CONFIRM"; then 
	clear
else 
	exit
fi

AVAILABLE=$(~/.dotfiles/detect.sh)

echo "$AVAILABLE"

echo "Use the Arrow Keys to Scroll, Press <Space> to select any \
number of options, and <Enter> to confirm."

mkOption() { 
	stringContains "$1" "$AVAILABLE" && echo "$1 " 
}


OPTIONS="$(mkOption "nvim")$(mkOption "alacritty")\
$(mkOption "neofetch")$(mkOption "bashrc")"

# NOTE: We intentionally don't double quote $OPTIONS, so that they are treated as several arguments.
gum choose --header "Available Configs:" $OPTIONS --no-limit

# TODO: Do the symbolic link thing - store which options are installed in a hidden file
# Then, Create an Uninstall script that removes things
# Also, make the location of ~/.dotfiles configurable

exit

ln -s ~/.dotfiles/nvim/ ~/.config/
ln -s ~/.dotfiles/alacritty/ ~/.config/
ln -s ~/.dotfiles/neofetch/ ~/.config/
ln -s ~/.dotfiles/bashrc/.bashrc ~
