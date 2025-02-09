return {
        "ellisonleao/gruvbox.nvim",
        name = "gruvbox",
        config = function()
                require("gruvbox").setup({
                })
                vim.cmd("colorscheme gruvbox") 
        end
}

-- test comment
