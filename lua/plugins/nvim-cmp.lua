return {
    "hrsh7th/nvim-cmp",

    event = { "InsertEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind.nvim",
        "L3MON4D3/LuaSnip",
    },

    config = function()
        local cmp = require("cmp")

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,noinsert",
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<S-CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = {
                { name = "copilot" },
                { name = "nvim_lsp" },
                { name = "buffer" },
                { name = "path" },
                { name = "luasnip" },
            },
            formatting = {
                format = require("lspkind").cmp_format({
                    maxwidth = 50,
                    ellipsis_char = '...',
                    symbol_map = { Copilot = "" }
                }),
            }
        })
    end
}
