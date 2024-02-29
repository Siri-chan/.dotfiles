#!/bin/bash

stringContains() { case $2 in *$1*) return 0;; *) return 1;; esac }

FILES=""

FILES="$(gum spin --title "    Detecting RipGrep..." -- rg -V && \
	echo "rg") $FILES"

FILES="$(# gum spin --title "    Detecting JetBrains Mono Nerd Font..." -- \
	# gum spin plays weird with the rg -q exit code
	fc-list : family | rg -q "JetBrainsMono Nerd" && echo "font") $FILES"
FILES="$(gum spin --title "    Detecting Alacritty..." -- alacritty -V \
	&& stringContains "font" "$FILES" && echo "alacritty") $FILES"

FILES="$(gum spin --title "    Detecting Fish..." -- fish -v && \
	echo "fish") $FILES"
FILES="$(gum spin --title "    Detecting FNM..." -- fnm -V && \
	echo "fnm") $FILES"
FILES="$(gum spin --title "    Detecting Bash..." -- bash --version \
	&& stringContains "fnm" "$FILES" && stringContains "fish" "$FILES" \
	&& echo "bashrc") $FILES"

FILES="$(gum spin --title "    Detecting Pixterm..." -- \
	pixterm --help && echo "pixterm") $FILES"
	#i cannot run neofetch --version because it returns 1, for some reason???
FILES="$(gum spin --title "    Detecting NeoFetch..." -- \
	neofetch --config none && stringContains "pixterm" "$FILES" \
	&& echo "neofetch") $FILES"

FILES="$(gum spin --title "    Detecting NeoVim..." -- nvim -v && \
	stringContains "rg" "$FILES" && echo "nvim") $FILES"
	# TODO: Don't know how to detect packer.

FILES="$(
# TODO: Detect others
) $FILES"

echo "$FILES"
