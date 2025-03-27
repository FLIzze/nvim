return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'debugloop/telescope-undo.nvim' -- Add the undo extension here
    },
    config = function()
        -- Set up Telescope
        require('telescope').setup {
            defaults = {
                -- Your default configuration here, if any
            }
        }

        -- Load the undo extension
        require('telescope').load_extension('undo')

        -- Key mappings
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find git files' })
        vim.keymap.set('n', '<C-f>', function()

        require('telescope.builtin').find_files({
            cwd = vim.fn.expand('$HOME/Documents/'),
        })
    end, { desc = 'Telescope find files from $HOME' })

        vim.keymap.set('n', '<leader>ps', function()
            require('telescope.builtin').live_grep({
                cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1], -- Git repo root
            })
        end, { desc = 'Telescope live grep Git files' })    

        -- Keybinding for undo extension with restore functionality
        vim.keymap.set('n', '<leader>u', function()
            require('telescope').extensions.undo.undo({
                mappings = {
                    i = {
                        -- Restore the selected change in insert mode
                        ["<CR>"] = require("telescope-undo.actions").yank_additions,
                        ["<S-CR>"] = require("telescope-undo.actions").yank_deletions,
                        ["<C-r>"] = require("telescope-undo.actions").restore,
                    },
                    n = {
                        -- Restore the selected change in normal mode
                        ["<CR>"] = require("telescope-undo.actions").yank_additions,
                        ["<S-CR>"] = require("telescope-undo.actions").yank_deletions,
                        ["<C-r>"] = require("telescope-undo.actions").restore,
                    },
                },
            })
        end, { desc = 'Telescope undo with restore' })
    end
}

