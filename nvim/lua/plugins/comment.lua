return {

    'ervinpm/Comment.nvim',
    config = function ()
        require('Comment').setup({
            mappings = {
                block = false
            },
        })
    end,
}

