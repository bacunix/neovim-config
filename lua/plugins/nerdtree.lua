return {
  {
    "preservim/nerdtree",
    dependencies = {
      "Xuyuanp/nerdtree-git-plugin",
      "unkiwii/vim-nerdtree-sync",
      "jcharum/vim-nerdtree-syntax-highlight",
      "ryanoasis/vim-devicons"
    },
    config = function()
      -- Keymap để toggle NERDTree
      vim.keymap.set('n', "<leader>e", ":NERDTreeToggle<CR>", {
        silent = true,
        noremap = true,
        desc = "Toggle NERDTree"
      })

      -- Cấu hình biểu tượng trạng thái Git
      vim.g.NERDTreeGitStatusIndicatorMapCustom = {
        Modified  = '✹',
        Staged    = '✚',
        Untracked = '✭',
        Renamed   = '➜',
        Unmerged  = '═',
        Deleted   = '✖',
        Dirty     = '✗',
        Ignored   = '☒',
        Clean     = '✔︎',
        Unknown   = '?',
      }

      vim.g.NERDTreeDirArrowExpandable = '▸'
      vim.g.NERDTreeDirArrowCollapsible = '▾'

      -- Cấu hình thêm cho vim-nerdtree-sync (nếu cần)
      vim.g.nerdtree_sync_cursorline = 1 -- Tùy chọn: đồng bộ cursorline
    end,
    keys = {
      { "<leader>e", desc = "NERDTree: Toggle file explorer" }
    },
  },
  {
    "Xuyuanp/nerdtree-git-plugin",
    lazy = true, -- Sẽ được load cùng với NERDTree
  },
  {
    "unkiwii/vim-nerdtree-sync",
    lazy = true, -- Sẽ được load cùng với NERDTree
  },
  {
    "jcharum/vim-nerdtree-syntax-highlight",
    lazy = true
  }
}
