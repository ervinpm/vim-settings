-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'Find Files'})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = 'Live GREP'})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'Find in buffers'})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ic', "<cmd>lua require'telescope.builtin'.find_files { cwd = '~/.config/nvim', file_ignore_patterns = { 'undodir/' } }<cr>", {desc = 'Find NVIM Config'})
vim.keymap.set('n', 'gb', "<cmd>bn<cr>", {desc = 'Next Buffer'})
vim.keymap.set('n', 'gB', "<cmd>bp<cr>", {desc = 'Previous Buffer'})

-- other stuff
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', {desc = 'Nvim Tree'})
vim.keymap.set('n', '<leader>k', ':cp', {desc = 'quick fix previous'})
vim.keymap.set('n', '<leader>j', ':cn', {desc = 'quick fix next'})
