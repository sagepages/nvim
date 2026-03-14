-- 1. Options & Plugins FIRST
require("user.options")
require("user.plugins") -- This MUST come before you try to require plugin configs

-- 2. Plugin Configs
require("user.keymaps")
require("user.autocommands")
require("user.colorscheme")
require("user.telescope")
require("user.treesitter")
require("user.harpoon")
require("user.nvim-tree")
require("user.bufferline")
require("user.lualine")
require("user.toggleterm")
require("user.indentline")
require("user.whichkey")
require("user.lsp") -- This handles all LSP sub-files
require("user.cmp")

-- DELETE the redundant nvim-tree setup code at the bottom of init.lua.
-- It should ONLY live in lua/user/nvim-tree.lua.
