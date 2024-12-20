return {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',  -- Automatically load the plugin for markdown files
    run = 'cd app && npm install',  -- Install any necessary dependencies (like npm packages)
    config = function()
        vim.keymap.set('n', '<Leader>mp', '<Plug>MarkdownPreview', { desc = 'Markdown Preview' })

        vim.g.mkdp_filetypes = { 'markdown' }
    end,
}

