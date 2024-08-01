return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { 'nvim-lua/plenary.nvim' }
        },
        keys = {
            { "-tt", "<cmd>Telescope find_files<cr>",                    desc = "Find Files" },
            { "-tg", "<cmd>Telescope live_grep<cr>",                     desc = "Live Grep" },
            { "-tc", "<cmd>Telescope commands<cr>",                      desc = "List Commands" },
            { "-tb", "<cmd>Telescope buffers<cr>",                       desc = "List Buffers" },
            { "-tm", "<cmd>Telescope marks<cr>",                         desc = "List Marks" },
            { "-ty", "<cmd>Telescope registers<cr>",                     desc = "List Registers" },
            { "-td", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Lsp Symbols" },
            { "-tD", "<cmd>Telescope diagnostics<cr>",                   desc = "Lsp Diagnostics" },
            { "-tr", "<cmd>Telescope lsp_refrences<cr>",                 desc = "Lsp Refrences" },
        },
        opts = {
            defaults = {
                file_ignore_patterns = { "node_modules", "target" },
            },
        }
    },
    {
        "williamboman/mason.nvim",
        dependencies = {
            "",
            "williamboman/mason-lspconfig.nvim",
            "folke/neoconf.nvim",
            "folke/neodev.nvim",
        },
        keys = {
            { "+mu", "<cmd>:MasonUpdate<cr>", desc = "Mason Update" },
            { "+mo", "<cmd>:Mason <cr>",      desc = "Mason Open Menu" }
        },
        opts = {
            ui = {
                icons = {
                    package_installed = "",
                    package_pending = "󱧘 ",
                    package_uninstalled = "󰏗 "
                }
            }
        },
    },
    {
        "neovim/nvim-lspconfig",
        keys = {
            { "<leader>d>", function() vim.lsp.buf.definition() end,                                                             'Go to definition' },
            { "<leader>D>", function() vim.lsp.buf.declaration() end,                                                            'Go to declaration' },
            { "<leader>i>", function() vim.lsp.buf.implementation() end,                                                         'Go to implementation' },
            { "<leader>r>", function() vim.lsp.buf.rename() end,                                                                 'Rename File' },
            { "<leader>R>", function() vim.lsp.buf.references() end,                                                             'Find References' },
            { "<leader>K>", function() vim.lsp.buf.hover() end,                                                                  'Show Hover Actions' },
            { "<leader>a>", function() vim.diagnostic.goto_prev({ popup_opts = { border = "rounded", focusable = false } }) end, 'Go to previous diagnostic' },
            { "<leader>s>", function() vim.diagnostic.goto_next({ popup_opts = { border = "rounded", focusable = false } }) end, 'Go to next diagnostic' }
        },
        opts = function()
            local lspconfig = require "lspconfig"
            local capabilities = require 'cmp_nvim_lsp'.default_capabilities()
            local servers = {
                "lua_ls",
                "tsserver",
                "docker_compose_language_service",
                "dockerls",
                "htmx",
                "html"
            }
            require("mason-lspconfig").setup {
                ensure_installed = servers,
            }
            for i, value in ipairs(servers) do
                lspconfig[value].setup {
                    capabilities = capabilities
                }
            end
            lspconfig.omnisharp.setup({
                capabilities = capabilities,
                enable_roslyn_analysers = true,
                enable_import_completion = true,
                organize_imports_on_format = true,
                enable_decompilation_support = true,
                filetypes = { 'cs', 'vb', 'csproj', 'sln', 'slnx', 'props', 'csx', 'targets' }
            })
            return {}
        end
    },
}
