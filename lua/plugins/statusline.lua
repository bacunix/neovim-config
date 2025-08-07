-- return {
--     'nvim-lualine/lualine.nvim',
--     dependencies = { 'nvim-tree/nvim-web-devicons' },
--     event = "VeryLazy",
--     config = function()
--         require('lualine').setup {
--               options = {
--                 icons_enabled = true,
--                 theme = 'auto',
--                 component_separators = { left = '', right = ''},
--                 section_separators = { left = '', right = ''},
--                 -- component_separators = {left = '|', right = '|'},
--                 -- section_separators = {left = '', right = ''},
--                 disabled_filetypes = {
--                 statusline = {},
--                 winbar = {},
--                 },
--                 ignore_focus = {},
--                 always_divide_middle = true,
--                 always_show_tabline = true,
--                 globalstatus = false,
--                 refresh = {
--                 statusline = 1000,
--                 tabline = 1000,
--                 winbar = 1000,
--                 refresh_time = 16, -- ~60fps
--                 events = {
--                     'WinEnter',
--                     'BufEnter',
--                     'BufWritePost',
--                     'SessionLoadPost',
--                     'FileChangedShellPost',
--                     'VimResized',
--                     'Filetype',
--                     'CursorMoved',
--                     'CursorMovedI',
--                     'ModeChanged',
--                 },
--                 }
--             },
--             sections = {
--                 lualine_a = {'mode'},
--                 lualine_b = {'branch', 'diff' ,'diagnostics'},
--                 lualine_c = {'filetype', 'filename'},
--                 lualine_x = {},
--                 lualine_y = {'encoding', 'fileformat', 'progress', 'time'},
--                 lualine_z = {'location'}
--             },
--             inactive_sections = {
--                 lualine_a = {},
--                 lualine_b = {},
--                 lualine_c = {'filename'},
--                 lualine_x = {'location'},
--                 lualine_y = {},
--                 lualine_z = {}
--             },
--             tabline = {
--                 lualine_a = {'buffers'},
--             },
--             winbar = {},
--             inactive_winbar = {},
--             extensions = {}
--         }
--
--     end
-- }

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- Load theme mặc định và chỉnh sửa
    local theme = require("lualine.themes.auto")
    
    -- Thiết lập màu nền theo ý muốn
    theme.normal.c.bg = "#242b38"    -- Màu nền section trung tâm
    theme.inactive.c.bg = "#242b38"  -- Màu nền khi không active
    
    return {
      options = {
        theme = theme,  -- Dùng theme đã chỉnh sửa
        globalstatus = false,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          "filetype",
          "filename",
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " ",
            },
          },
        },
        lualine_x = {
          {
            "diff",
            symbols = {
              added = " ",
              modified = " ",
              removed = " ",
            },
          },
          "fileformat",
        },
        lualine_y = { "progress" },
        lualine_z = {
          "location",
          function()
            return " " .. os.date("%H:%M")
          end,
        },
      },
      tabline = {
        lualine_a = {"buffers"}, 
      },
      extensions = { "neo-tree" }
    }
  end,
  -- Đảm bảo cập nhật màu khi thay đổi colorscheme
  config = function(_, opts)
    require('lualine').setup(opts)
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function() require('lualine').setup(opts) end
    })
  end
}
