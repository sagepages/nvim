-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

-- Vim nvim tree transparency
vim.cmd [[
  autocmd VimEnter * hi NvimTreeNormal guibg=NONE
  autocmd VimEnter * hi NvimTreeRootFolder guibg=NONE
  autocmd VimEnter * hi NvimTreeFolderName guibg=NONE
  autocmd VimEnter * hi NvimTreeFolderIcon guibg=NONE
  autocmd ColorScheme * hi NvimTreeNormal guibg=NONE
  autocmd ColorScheme * hi NvimTreeNormalNC guibg=NONE
]]

