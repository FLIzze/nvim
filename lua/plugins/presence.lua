return {
    {
        "andweeb/presence.nvim",
        lazy = false,  -- Ensure it's loaded immediately
        config = function()
            require("presence").setup({
                -- Customize your settings here
            })
        end
    }
}

