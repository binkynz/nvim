return {
    "SmiteshP/nvim-navbuddy",

    dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>fm", ":Navbuddy<cr>", desc = "File manager" },
    },

    config = function()
        local actions = require("nvim-navbuddy.actions")

        require("nvim-navbuddy").setup({
            lsp = { auto_attach = true },
            window = { border = "rounded" },
            icons = {
                File          = "file:",
                Module        = "module:",
                Namespace     = "namespace:",
                Package       = "package:",
                Class         = "class:",
                Method        = "method:",
                Property      = "property:",
                Field         = "field:",
                Constructor   = "ctor:",
                Enum          = "enum:",
                Interface     = "iface:",
                Function      = "fn:",
                Variable      = "var:",
                Constant      = "const:",
                String        = "str:",
                Number        = "num:",
                Boolean       = "bool:",
                Array         = "array:",
                Object        = "obj:",
                Key           = "key:",
                Null          = "null:",
                EnumMember    = "enum-member:",
                Struct        = "struct:",
                Event         = "event:",
                Operator      = "operator:",
                TypeParameter = "type-parameter:",
            },
            node_markers = {
                enabled = true,
                icons = {
                    leaf = " ",
                    leaf_selected = ">",
                    branch = ">>",
                },
            },
            mappings = {
                ["<esc>"] = actions.close(),        -- Close and cursor to original location
                ["q"] = actions.close(),
                ["j"] = actions.next_sibling(),     -- down
                ["k"] = actions.previous_sibling(), -- up
                ["h"] = actions.parent(),           -- Move to left panel
                ["l"] = actions.children(),         -- Move to right panel
                ["0"] = actions.root(),             -- Move to first panel
                ["v"] = actions.visual_name(),      -- Visual selection of name
                ["V"] = actions.visual_scope(),     -- Visual selection of scope
                ["y"] = actions.yank_name(),        -- Yank the name to system clipboard "+
                ["Y"] = actions.yank_scope(),       -- Yank the scope to system clipboard "+
                ["i"] = actions.insert_name(),      -- Insert at start of name
                ["I"] = actions.insert_scope(),     -- Insert at start of scope
                ["a"] = actions.append_name(),      -- Insert at end of name
                ["A"] = actions.append_scope(),     -- Insert at end of scope
                ["r"] = actions.rename(),           -- Rename currently focused symbol
                ["d"] = actions.delete(),           -- Delete scope
                ["f"] = actions.fold_create(),      -- Create fold of current scope
                ["F"] = actions.fold_delete(),      -- Delete fold of current scope
                ["c"] = actions.comment(),          -- Comment out current scope
                ["<enter>"] = actions.select(),     -- Goto selected symbol
                ["o"] = actions.select(),
                ["J"] = actions.move_down(),        -- Move focused node down
                ["K"] = actions.move_up(),          -- Move focused node up
                ["t"] = actions.telescope({         -- Fuzzy finder at current level.
                    layout_config = {
                        height = 0.60,              -- passed to telescope.nvim's
                        width = 0.60,               -- default can be passed here.
                        prompt_position = "top",
                        preview_width = 0.50
                    },
                    layout_strategy = "horizontal"
                }),
                ["g?"] = actions.help(), -- Open mappings help window
            },
        })
    end,
}
