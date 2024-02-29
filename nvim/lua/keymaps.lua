-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ic', "<cmd>lua require'telescope.builtin'.find_files { cwd = '~/.config/nvim', file_ignore_patterns = { 'undodir/' } }<cr>", {})
vim.keymap.set('n', 'gb', "<cmd>bn<cr>", {})
vim.keymap.set('n', 'gB', "<cmd>bp<cr>", {})

-- other stuff
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', {})
vim.keymap.set('n', '<leader>k', ':cp', {desc = 'quick fix previous'})
vim.keymap.set('n', '<leader>j', ':cn', {desc = 'quick fix next'})
