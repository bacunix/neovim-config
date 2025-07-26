return {
    {
        "tpope/vim-fugitive"
    },

    {
        "tpope/vim-rhubarb"
    },

    {
        "airblade/vim-gitgutter"
    },

    {
        "samoshkin/vim-mergetool",

        config = function()
            vim.g.mergetool_layout = 'mr'
            vim.g.mergetool_prefer_revision = 'local'
        end,
    },

}
