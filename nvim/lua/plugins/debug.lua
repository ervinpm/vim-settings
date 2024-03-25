return {
    {
        'mfussenegger/nvim-dap',
        lazy = true,
        dependencies = { "nvim-neotest/nvim-nio" },
        config = function()
            local dap, dapui = require("dap"), require("dapui")
            local widgets = require('dap.ui.widgets')

            vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Continue debugging' })
            vim.keymap.set('n', '<F8>', dap.step_over, { desc = 'Step over' })
            vim.keymap.set('n', '<F7>', dap.step_into, { desc = 'Step into' })
            vim.keymap.set('n', '<F9>', dap.step_out, { desc = 'Step out' })
            vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
            vim.keymap.set({ 'n', 'v' }, '<leader>dh', widgets.hover, { desc = 'Debug hover' })
            vim.keymap.set({ 'n', 'v' }, '<leader>dp', widgets.preview, { desc = 'Debug preview' })

            vim.keymap.set('n', '<leader>df', function()
                widgets.centered_float(widgets.frames)
            end, { desc = 'debug frames' })

            vim.keymap.set('n', '<leader>ds', function()
                widgets.centered_float(widgets.scopes)
            end, { desc = 'debug scopes' })

            dapui.setup()
            dap.listeners.before.attach.dapui_config = function()
              dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
              dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
              dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
              dapui.close()
            end

        end,
    },
}
