return {
	"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require 'nvim-treesitter.configs'
        configs.setup {
            ensure_installed = {
                "javascript",
                "typescript",
                "tsx",
                "dockerfile",
                "c_sharp",
                "markdown",
                "markdown_inline",
                "comment",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            sync_install = false,
        }
    end,
}

