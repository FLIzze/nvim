function ColorMyPencils(color)
	color = color or 'kanagawa-wave'
	vim.cmd.colorscheme(color)

    -- Set the background to transparent
    -- vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')
    -- vim.cmd('highlight SignColumn guibg=NONE ctermbg=NONE')
end

return {
  {
    "rebelot/kanagawa.nvim",
    name = "lotus",
    config = function()
	    ColorMyPencils()
    end
  }
}
