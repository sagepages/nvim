-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local tree_wins = {}
		local floating_wins = {}
		local wins = vim.api.nvim_list_wins()
		for _, w in ipairs(wins) do
			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
			if bufname:match("NvimTree_") then
				table.insert(tree_wins, w)
			end
			if vim.api.nvim_win_get_config(w).relative ~= "" then
				table.insert(floating_wins, w)
			end
		end
		if #wins - #floating_wins - #tree_wins == 0 then
			-- If only NvimTree is left, quit
			vim.cmd("quit")
		end
	end,
})
-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
	end,
})

-- Vim nvim tree transparency
vim.cmd([[
  autocmd VimEnter * hi NvimTreeNormal guibg=NONE
  autocmd VimEnter * hi NvimTreeRootFolder guibg=NONE
  autocmd VimEnter * hi NvimTreeFolderName guibg=NONE
  autocmd VimEnter * hi NvimTreeFolderIcon guibg=NONE
  autocmd ColorScheme * hi NvimTreeNormal guibg=NONE
  autocmd ColorScheme * hi NvimTreeNormalNC guibg=NONE
]])
