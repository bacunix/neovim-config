vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove("c")
    vim.opt_local.formatoptions:remove("r")
    vim.opt_local.formatoptions:remove("o")
  end
})

vim.g.netrw_buffers = {}

vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local filetype = vim.bo[buf].filetype
    
    if filetype == "netrw" then
      -- Thêm buffer netrw vào danh sách
      vim.g.netrw_buffers[buf] = true
    else
      -- Xoá tất cả buffer netrw khi mở file thường
      for netrw_buf, _ in pairs(vim.g.netrw_buffers) do
        if vim.api.nvim_buf_is_valid(netrw_buf) and netrw_buf ~= buf then
          vim.api.nvim_buf_delete(netrw_buf, { force = true })
          vim.g.netrw_buffers[netrw_buf] = nil
        end
      end
    end
  end
})
