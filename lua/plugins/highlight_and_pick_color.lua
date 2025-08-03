return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    -- Bật termguicolors để hiển thị màu chính xác
    vim.opt.termguicolors = true

    -- Chỉ cần setup 1 lần duy nhất
    require('colorizer').setup({
      '*', -- Highlight tất cả filetypes
      css = { 
        rgb_fn = true,    -- Bật phân tích rgb()
        hsl_fn = true,    -- Bật phân tích hsl()
        mode = 'background', -- Hiển thị màu nền
      },
      javascript = {
        mode = 'foreground', -- Hiển thị màu chữ
      },
      html = {
        mode = 'background',
        names = false,      -- Tắt các tên màu như "Red", "Blue"
      },
      '!vim',              -- Loại trừ filetype vim
      '!lua',              -- Loại trừ filetype lua (tuỳ chọn)
    })
  end
}
