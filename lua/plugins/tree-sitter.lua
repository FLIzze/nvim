return {
    {
        "nvim-treesitter/nvim-treesitter",
        run = ':TSUpdate',  -- Ensure parsers are installed
        config = function()
            require'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the listed parsers MUST always be installed)
                ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "javascript", "typescript", "python" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = true,
                },
                indent = {
                    enable = false
                }
            }
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require'treesitter-context'.setup {
                enable = true,  -- Enable the context window
                max_lines = 0,  -- Adjust how many lines to show above the current context (0 shows the full context)
            }
        end,
    },
}

