return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself

    config = function()
        require("neo-tree").setup({
            source_selector = {
                    winbar = true,
                    statusline = true
            },
            default_component_configs = {
                git_status = {
                symbols = {
                    -- Change type
                    added     = "✚",
                    deleted   = "✖",
                    modified  = "",
                    renamed   = "󰁕",
                    -- Status type
                    untracked = "",
                    ignored   = "",
                    unstaged  = "󰄱",
                    staged    = "",
                    conflict  = "",
                }
                }
            }
        })
        vim.diagnostic.config({
        signs = {
            text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.INFO] = '',
            [vim.diagnostic.severity.HINT] = '󰌵',
            },
        }
        })

        vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {silent = true});
    end
  }
}
