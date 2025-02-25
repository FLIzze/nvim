return {
    {
        'L3MON4D3/LuaSnip', -- Snippet engine
        config = function()
            local luasnip = require('luasnip')

            -- Load snippets from friendly-snippets
            require('luasnip.loaders.from_vscode').lazy_load()
        end,
    },
    { 'rafamadriz/friendly-snippets' }, 
}

