return {
    {
        "0xstepit/flow.nvim",
        name = "flow",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        'maxmx03/fluoromachine.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            local fm = require 'fluoromachine'

            fm.setup {
                glow = true,
                theme = 'fluoromachine',
                transparent = true,
            }

            vim.cmd.colorscheme 'fluoromachine'
            local lualine = require 'lua.plugins.ui'

            lualine.setup {
                options = {
                    theme = 'fluoromachine'
                }
            }
        end
    }
}
