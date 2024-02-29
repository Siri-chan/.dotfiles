# Bob the Fish Config
set -g theme_nerd_fonts yes
set -g theme_display_git_default_branch yes
set -g theme_title_display_process yes
set -g theme_title_display_user yes
set -g theme_title_use_abbreviated_path no
set -g theme_display_user yes
set -g theme_display_hostname yes
set -g theme_show_exit_status yes
## TODO: Colors are fucked up bc they are B/W right now. Maybe use the Catpuccin theme or some other PowerLine Theme instead?
set -g theme_color_scheme terminal-dark
## TODO: I kinda want to remove the date from RPS1

# Other Config
set -g fish_prompt_pwd_dir_length 0

if status is-interactive
    # Commands to run in interactive sessions can go here
end
