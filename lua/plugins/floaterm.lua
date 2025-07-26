return {
    "voldikss/vim-floaterm",

    config = function()
        vim.g.floaterm_shell = 'nu'
        vim.keymap.set('n', "<leader>f", ":FloatermNew --height=0.5 --width=1.0 --position=bottomleft --title='nuShell'<CR>");
    end
}
