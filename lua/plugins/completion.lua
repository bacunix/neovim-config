return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
    },
    lazy = false,
    config = function()
        require("cmp").setup({
            sources = {
                { name = "buffer" },
            },
            mapping = {
                ['<Tab>'] = function(fallback)
                    if require("cmp").visible() then
                        require("cmp").select_next_item()
                    else
                        fallback()
                    end
                end,
                ['<S-Tab>'] = function(fallback)
                    if require("cmp").visible() then
                        require("cmp").select_prev_item()
                    else
                        fallback()
                    end
                end,
                ['<CR>'] = require("cmp").mapping.confirm({ select = true }),
            }
        })
    end
}
