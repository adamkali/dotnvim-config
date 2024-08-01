return {
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = {
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                        col_offset = -3,
                        side_padding = 0,
                    },
                },
                mapping = {
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<C-j>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-k>'] = cmp.mapping.scroll_docs(4),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                    { name = 'path' },
                }
            })
        end
    },
    {
        'hrsh7th/cmp-nvim-lsp',
    },
    {
        'hrsh7th/cmp-buffer',
    },
    {
        'hrsh7th/cmp-path',
    },
    {
        'L3MON4D3/LuaSnip'
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" },
        opts = function () require("luasnip.loaders.from_vscode").lazy_load() end
    },
    {
        'saadparwaiz1/cmp_luasnip'
    },
}
