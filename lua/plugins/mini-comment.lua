return {
    "echasnovski/mini.comment",

    event = "VeryLazy",

    config = function()
        require("mini.comment").setup({
            mappings = {
                -- Toggle comment (like `gcip` - comment inner paragraph) for both
                -- Normal and Visual modes
                comment = 'gc',

                -- Toggle comment on current line
                comment_line = 'gcc',

                -- Define 'comment' textobject (like `dgc` - delete whole comment block)
                textobject = 'gc',
            },
        })
    end
}
