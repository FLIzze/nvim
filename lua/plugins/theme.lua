return {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
                vim.cmd("colorscheme rose-pine") 
                vim.cmd("hi Normal guibg=black") 
        end
}
