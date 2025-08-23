local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- reload 
vim.api.nvim_set_keymap('n', '<leader>r', ':e!<CR>', {noremap = true, silent = true})

-- toggle list chars
vim.keymap.set('n', '<leader>l', function()
  vim.opt.list = not vim.opt.list:get()
end, {desc = "Toggle list chars"})


-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

map("n", "gn" , "*", { desc = "highlight word"})

-- close buffer without exit neovim
map("n", "<leader>bd", ":bp|sp|bn|bd<cr>", { desc = "close buffer without quit neovim"} )

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw

map(
"n",
"<leader>ur",
"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
{ desc = "Redraw / clear hlsearch / diff update" }
)

-- go to corressponding bracket
map("n", "gp", "%", { desc = "go to corressponding bracket"})

-- line navigator
map("n" , "gh" , "0", { desc = "go to begin of line"})
map("n" , "gl" , "$", { desc = "go to end of line"})

-- word navigator
map("n" , "B" , "bi", { desc = "go to first character of word"})
map("n" , "W" , "ei", { desc = "go to end character of word"})

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Save file
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- New file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
 
-- Windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- Tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

function Download_and_extract(url)
    if not url or url == "" then
        print("Usage: :Dow <url>")
        print("Example: :Dow https://example.com/file.zip")
        return
    end

    -- 1. Lấy tên file từ URL
    local filename = url:match("([^/]+)$")
    local download_path = vim.fn.getcwd() .. "/" .. filename -- Tải về thư mục hiện tại

    print("Downloading " .. filename .. " to current directory...")

    -- 2. Download using aria2
    local aria2_cmd = { "aria2c", "-o", filename, url }

    vim.fn.jobstart(aria2_cmd, {
        on_exit = function(_, exit_code)
            if exit_code == 0 then
                print("Download completed: " .. filename)
                -- 3. Check if file is an archive
                check_and_extract(download_path)
            else
                print("Download failed with code: " .. exit_code)
            end
        end,
        stdout_buffered = true,
    })
end

function check_and_extract(filepath)
    local archive_extensions = {
        zip = true, rar = true, ["7z"] = true, tar = true,
        gz = true, xz = true, bz2 = true, zst = true
    }

    local extension = filepath:match("%.([^%.]+)$")
    if not extension or not archive_extensions[extension:lower()] then
        print("File is not a recognized archive. Skipping extraction.")
        return
    end

    local choice = vim.fn.input("File is an archive. Extract it? (y/N): ")
    choice = choice:lower()

    if choice ~= "y" and choice ~= "yes" then
        print("Skipping extraction.")
        return
    end

    -- 4. Build extraction command
    local extract_cmd
    local default_dir = vim.fn.getcwd() -- Giải nén ngay tại thư mục hiện tại

    if extension == "zip" then
        extract_cmd = { "unzip", "-q", "-o", filepath, "-d", default_dir }
    elseif extension == "rar" then
        extract_cmd = { "unrar", "x", "-y", filepath, default_dir .. "/" }
    elseif extension == "7z" then
        extract_cmd = { "7z", "x", "-y", "-o" .. default_dir, filepath }
    elseif extension:match("tar%.%a+") or extension == "tar" then
        extract_cmd = { "tar", "-xf", filepath, "-C", default_dir }
    else
        print("Extraction for ." .. extension .. " is not implemented yet.")
        return
    end

    -- 5. Run extraction
    print("Extracting to current directory...")
    vim.fn.jobstart(extract_cmd, {
        on_exit = function(_, extract_exit_code)
            if extract_exit_code == 0 then
                print("Extraction completed successfully!")
            else
                print("Extraction failed with code: " .. extract_exit_code)
            end
        end,
        stdout_buffered = true,
    })
end

-- Tạo command đơn giản chỉ cần URL
vim.api.nvim_create_user_command('Dow', function(opts)
    Download_and_extract(opts.args)
end, { nargs = 1, desc = 'Download a file with aria2 and optionally extract it in current directory' })
