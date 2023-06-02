return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files in current working directory" },
        { "<leader>fs", "<cmd>Telescope live_grep<cr>",  desc = "Find string in current working directory" },
        { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "List help tags" },
    },

    config = function()
        require("telescope").setup({

        })
    end,
}
