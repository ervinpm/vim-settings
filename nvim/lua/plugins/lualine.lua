return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup { 
            options = { theme = "catppuccin" },
            tabline = {
              lualine_a = {'buffers'},
              lualine_b = {},
              lualine_c = {},
              lualine_x = {},
              lualine_y = {},
              lualine_z = {'tabs'}
            },
        }
    end
}
