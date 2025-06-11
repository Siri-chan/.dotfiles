# eval $(ssh-agent -c) >> /dev/null
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
