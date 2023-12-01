# `bashrc`
This is a basic terminal config for GNU `bash`. I don't use bash, but fish 
shouldn't be used as a login shell (See Footnote 1.), so this script sets
the environment to be happy, and runs some fish-incompatible things, like 
`fnv env`, before automatially launching fish in any interactive shell.

Therefore, this should generally be included if you wish to drive my config for fish.

Requires:
fnv, because it gets environment variables from it.
bash (duh)
and fish.


## Footnotes
1. Using `fish` as a login shell:
> **Warning:**
> Setting fish as your login shell may cause issues, such as an incorrect PATH. Some operating systems, including a number of Linux distributions, require the login shell to be Bourne-compatible and to read configuration from /etc/profile. fish may not be suitable as a login shell on these systems. 
https://fishshell.com/docs/current/index.html#default-shell
