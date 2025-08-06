return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- Sử dụng phiên bản mới nhất
    config = function()
      require("toggleterm").setup({
        size = 20, -- Chiều cao terminal (nếu mở ngang) hoặc chiều rộng (nếu mở dọc)
        open_mapping = [[<C-n>]], -- Phím tắt để bật/tắt terminal
        hide_numbers = true, -- Ẩn số dòng trong terminal
        shade_filetypes = {},
        shade_terminals = true, -- Làm tối nền terminal
        shading_factor = 2, -- Độ tối của terminal
        start_in_insert = true, -- Bắt đầu ở chế độ Insert
        insert_mappings = true, -- Áp dụng phím tắt trong chế độ Insert
        terminal_mappings = true, -- Áp dụng phím tắt trong chế độ Terminal
        persist_size = true, -- Lưu kích thước terminal giữa các lần mở
        direction = "float", -- Hướng mở: "float", "horizontal", "vertical", hoặc "tab"
        close_on_exit = true, -- Đóng terminal khi lệnh exit (như Ctrl+D hoặc exit)
        shell = "nu", -- Shell mặc định (bash, zsh, powershell, v.v.)
        float_opts = {
            border = "curved", -- Kiểu viền: "single", "double", "shadow", "curved"
            winblend = 0, -- Độ trong suốt
            highlights = {
            border = "rounded",
            background = "Normal",
            },
        },
        })
    end,
  },
}
