-- load basic vimrc
local script_path = debug.getinfo(1, "S").source:match("^@(.+)$")
local script_dir = script_path:match("^(.*[\\/])")
vim.cmd('source ' .. script_dir .. '/vimrc')

-- pathogen
vim.fn['pathogen#infect']('plugins/{}')

-- coloscheme
vim.cmd.colorscheme "modus"
function toggle_color_mode ()
   if vim.o.background == 'dark' then
      vim.o.background = 'light'
   else
      vim.o.background = 'dark'
   end
end
vim.keymap.set('n', '<leader>gg', toggle_color_mode, { desc = 'Toggle color mode' })

-- oil.vim
require("oil").setup()

-- telescope.nvim
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
