# nvim

## Usage

neovim:

```
$ git clone https://github.com/undus5/nvim.git ~/.config/nvim
```

vim basic:

```
$ curl -L https://github.com/undus5/nvim/raw/main/vimrc -o ~/.vimrc
```

## Keybindings

`Space` is the <leader> key

`Space + Enter` -> clear highlight search

`Space + c` -> copy to clipboard\
`Space + v` -> paste to clipboard\
`Space + V` -> paste to clipboard

`Space + f + f` -> telescope find files\
`Space + f + g` -> telescope live grep\
`Space + f + b` -> telescope find buffers

`Ctrl + h` -> previous buffer\
`Ctrl + l` -> next buffer

## Plugins

[tpope/vim-pathogen](https://github.com/tpope/vim-pathogen)
plugin manager

[stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)
file explorer

[telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
(deps: [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim),
[BurntSushi/ripgrep](kttps://github.com/BurntSushi/ripgrep))
fuzzy finder, to let it respect `.gitignore`, git repo needs to be initialized.

[modus-themes.nvim](https://github.com/miikanissi/modus-themes.nvim)
current colorscheme
