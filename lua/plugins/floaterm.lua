return {
    "voldikss/vim-floaterm",
    config = function()
        vim.g.floaterm_shell = 'nu'
        vim.g.floaterm_height = 17
        vim.g.floaterm_width = 137
        vim.g.floaterm_position = 'bottomleft'
        vim.g.floaterm_title = 'nuShell'
        -- Key mappings
        vim.keymap.set('n', "<C-n>", ":FloatermToggle<CR>", {silent = true})
        vim.keymap.set('t', '<C-n>', '<C-\\><C-n>:FloatermToggle<CR>', {silent = true})
    end
}
