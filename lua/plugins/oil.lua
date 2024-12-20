return {
    {
        'nvim-tree/nvim-web-devicons', -- Ensure devicons is loaded before oil.nvim
        config = function()
            require("nvim-web-devicons").setup() -- Make sure devicons are configured
        end
    },
    {
        'stevearc/oil.nvim',
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup {
                keymaps = {
                    ["<C-p>"] = false,
                    ["<C-s>"] = false,
                    ["<C-t>"] = false,
                },
            }

            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "open parent directory" })
            vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
        end
    }
}

