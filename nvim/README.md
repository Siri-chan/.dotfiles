# .nvim
This is my neovim config, should be placed in `~/.config/nvim`. 
**Requires packer.nvim and ripgrep installed.**

## Non-Default Bindings:
Leader Key - Space
L-e = Open NetRW
L-u = Open UndoTree
L-f = Fuzzy-find Files
L-s = Grep CWD
L-gf = Fuzzy-find Files in a Git Repo
L-gs = git status
L-gl = git log
L-gd = git diff
L-gb = git blame

## About the LSP
This setup uses lsp-zero with default bindings.
It is setup to use mason, which you can open with :Mason, and install any LSP you like by pressing i on its name.
Then, jsut restart nvim and the relevant LSP will be setup.
You can also use C-f for a filter on what language LSPs you want to look for.
This also means you dont need the LSP separately (ie. through rustup with rust-analyzer for example). 
However, you might need a relevant executable like nvm or lua-rocks
