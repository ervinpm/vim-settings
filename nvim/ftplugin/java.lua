local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)

-- needed for debugging
-- IMPORTANT: requires installation of microsoft libraries documented here: https://github.com/mfussenegger/nvim-jdtls?tab=readme-ov-file#java-debug-installation
local bundles = {
    vim.fn.glob(
        os.getenv('HOME') ..
        "/code/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
        1)
}
vim.list_extend(bundles, vim.split(vim.fn.glob(os.getenv('HOME') .. "/code/vscode-java-test/server/*.jar", 1), "\n"))

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
        -- '-javaagent:' .. vim.fn.stdpath('data') .. '/mason/packages/jdtls/lombok.jar',
        '-javaagent:' .. os.getenv('HOME') .. '/Downloads/lombok.jar',
        '-jar', vim.fn.stdpath('data') ..
    '/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar',
        '-configuration', vim.fn.stdpath('data') .. '/mason/packages/jdtls/config_linux',
        '-data', os.getenv('HOME') .. '/workspace/' .. vim.fn.fnamemodify(root_dir, ":p:h:t")
    },

    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
    capabilities = {
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = true
                }
            }
        }

    },
    settings = {
        java = {
            signatureHelp = { enabled = true },
            format = {
                settings = {
                    url = os.getenv('HOME') .. '/.config/nvim/formatter/java-format.xml'
                }
            },
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
        bundles = bundles,
    },
    on_attach = function()

        -- Debug configuration
        -- Remove if not needed
        local dap = require('dap')
        dap.configurations.java = {
            {
                javaExec = "java",
                request = "launch",
                name = "Launch Java",
                type = "java",
            },
            {
                type = "java",
                request = "attach",
                name = "Debug (Attach) - Remote",
                hostName = "127.0.0.1",
                port = 5005,
            },
        }


        -- java specific keymaps
        local jdtls = require('jdtls')
        local key_options = function(desc)
            return { noremap = true, silent = true, desc = desc }
        end
        vim.keymap.set('n', '<leader>di', jdtls.organize_imports, key_options('organize imports'))
        vim.keymap.set('n', '<leader>dt', jdtls.test_class, key_options('run test class'))
        vim.keymap.set('n', '<leader>dn', jdtls.test_nearest_method, key_options('run test method'))
        vim.keymap.set('n', '<leader>de', jdtls.extract_variable, key_options('extract variable'))
        vim.keymap.set('v', '<leader>de', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
            key_options('extract variable'))
        vim.keymap.set('v', '<leader>dm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
            key_options('extract method'))

    end
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
