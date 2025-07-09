return {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
    },
    config = function()
        local lsp = require('lsp-zero')
        local lspconfig = require("lspconfig")
        lspconfig["ts_ls"].setup({})

        -- Configure Mason
        require('mason').setup()

        -- Configure Mason LSPConfig
        require('mason-lspconfig').setup({
            ensure_installed = {
                'html', 'cssls', 'pyright',
                'ts_ls', 'gopls', 'eslint', 'tailwindcss',
            },
        })

        -- Use lsp-zero to set up the recommended preset
        lsp.preset('recommended')

        -- Set up nvim-cmp for completion
        lsp.setup_nvim_cmp({
            completion = {
                completeopt = 'menuone,noinsert,noselect', -- Disable space after completion
            },
            mapping = {
                ['<C-n>'] = require('cmp').mapping.select_next_item(),
                ['<C-p>'] = require('cmp').mapping.select_prev_item(),
                ['<C-Space>'] = require('cmp').mapping.complete(),
                -- Disable autocomplete confirmation with <CR> or <Enter>
                ['<CR>'] = function()
                    -- Simply add a newline on Enter (does nothing with LSP or completion)
                    vim.api.nvim_feedkeys(
                        vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", true)
                end,
                ['<C-k>'] = require('cmp').mapping.confirm({ select = true }),
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            },
        })

        lsp.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, silent = true }

            -- LSP diagnostic navigation
            vim.keymap.set('n', '[g', vim.diagnostic.goto_prev, opts)
            vim.keymap.set('n', ']g', vim.diagnostic.goto_next, opts)

            -- Go to definition, type, implementation, references
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

            -- Code actions
            vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, opts)

            -- Rename
            vim.keymap.set('n', '<leader>n', vim.lsp.buf.rename, opts)

            -- Hover documentation
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

            -- Manual format keybinding
            vim.keymap.set('n', "<leader>lf", function()
                vim.lsp.buf.format({ async = false })
            end, opts)

            -- Format on save
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ async = false })
                    end,
                })
            end
        end)

        lsp.setup()
    end,
}
