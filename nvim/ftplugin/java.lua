local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

local config = {
    -- uses mason jdtls install path
    cmd = {
        'java', -- or '/path/to/java17_or_newer/bin/java'
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xmx1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. vim.fn.stdpath('data') .. '/mason/packages/jdtls/lombok.jar',
        '-jar', vim.fn.stdpath('data') .. '/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar',
        '-configuration', vim.fn.stdpath('data') .. '/mason/packages/jdtls/config_linux',
        '-data', os.getenv('HOME') .. '/workspace/' .. vim.fn.fnamemodify(root_dir, ":p:h:t")
    },

    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    settings = {
        java = {
            runtimes = {
                {
                    name = "OpenJDK-8",
                    path = "/usr/lib/jvm/java-8-openjdk",
                },
                {
                    name = "JavaSE-11",
                    path = "/usr/lib/jvm/java-11-openjdk",
                },
                {
                    name = "JavaSE-17",
                    path = "/usr/lib/jvm/java-17-openjdk",
                },
            }
        }
    },

    -- Language server `initializationOptions`
    -- You need to extend the `bundles` with paths to jar files
    -- if you want to use additional eclipse.jdt.ls plugins.
    --
    -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
    init_options = {
        bundles = {}
    },
    on_attach = function ()
        -- java specific keymaps
        local opts = { noremap=true, silent=true }
        vim.keymap.set('n', '<leader>di', "<Cmd>lua require('jdtls').organize_imports()<CR>", opts)
        vim.keymap.set('n', '<leader>dt', "<Cmd>lua require('jdtls').test_class()<CR>", opts)
        vim.keymap.set('n', '<leader>dn', "<Cmd>lua require('jdtls').test_nearest_method()<CR>", opts)
        vim.keymap.set('n', '<leader>de', "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
        vim.keymap.set('v', '<leader>de', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
        vim.keymap.set('v', '<leader>dm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", opts)
    end
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

