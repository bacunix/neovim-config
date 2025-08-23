return {
    {
        "X3eRo0/dired.nvim",
        dependencies = {"MunifTanjim/nui.nvim"},
        config = function()
            require("dired").setup {
                path_separator = "/",
                show_banner = false,
                show_icons = false,
                show_hidden = true,
                show_dot_dirs = true,
                show_colors = true,

                keybinds = {
                    dired_enter = "<cr>",
                    dired_back = "-",
                    dired_up = "_",
                    dired_rename = "R",
                    dired_create = "d",
                    dired_delete = "D",
                    dired_delete_range = "D",
                    dired_copy = "C",
                    dired_copy_range = "C",
                    dired_copy_marked = "MC",
                    dired_move = "X",
                    dired_move_range = "X",
                    dired_move_marked = "MX",
                    dired_paste = "P",
                    dired_mark = "M",
                    dired_mark_range = "M",
                    dired_delete_marked = "MD",
                    dired_shell_cmd = "!",
                    dired_shell_cmd_marked = "&",
                    dired_toggle_hidden = ".",
                    dired_toggle_sort_order = ",",
                    dired_toggle_icons = "*",
                    dired_toggle_colors = "c",
                    dired_toggle_hide_details = "(",
                    dired_quit = "q",
                },
            }
            -- auto open dired if not have any file
            vim.api.nvim_create_autocmd("VimEnter", {
            pattern = "*",
            callback = function()
                if vim.fn.argv(0) == "" then
                vim.cmd("Dired")
                end
            end
            })

            vim.keymap.set("n", "<leader>e", ":Dired .<CR>", {silent = true});
        end
    }
}
