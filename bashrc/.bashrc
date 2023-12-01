#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="$HOME/.cargo/bin:$PATH"
export QT_QPA_PLATFORMTHEME="qt6ct"
eval `fnm env`

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Run fish whenever running interactively. 
# It's not good to run fish as a login shell, you see, so we bootstrap it with bash
fish

