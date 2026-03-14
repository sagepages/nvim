local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

wk.setup({
	preset = "classic",
	spec = {
		-- Single Keys (Non-grouped)
		{
			"<leader>e",
			"<cmd>NvimTreeToggle<cr>",
			desc = "Explorer",
		},
		{
			"<leader>w",
			"<cmd>w!<cr>",
			desc = "Save",
		},
		{
			"<leader>q",
			"<cmd>q!<cr>",
			desc = "Quit",
		},
		{
			"<leader>h",
			"<cmd>nohlsearch<cr>",
			desc = "No Highlight",
		},
		{
			"<leader>c",
			"<cmd>Bdelete!<cr>",
			desc = "Close Buffer",
		},

		-- File & Search (Merged Wave 1 & Telescope)
		{
			"<leader>f",
			"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = true})<cr>",
			desc = "Find Files",
		},
		{
			"<leader>F",
			"<cmd>Telescope live_grep theme=ivy<cr>",
			desc = "Find Text",
		},
		{
			"<leader>b",
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = true})<cr>",
			desc = "Buffers",
		},

		-- Groups
		{ "<leader>g", group = "Git" },
		{
			"<leader>gg",
			"<cmd>lua _LAZYGIT_TOGGLE()<cr>",
			desc = "Lazygit",
		},
		{
			"<leader>gb",
			"<cmd>Telescope git_branches<cr>",
			desc = "Checkout Branch",
		},
		{
			"<leader>gc",
			"<cmd>Telescope git_commits<cr>",
			desc = "Checkout Commit",
		},
		{
			"<leader>go",
			"<cmd>Telescope git_status<cr>",
			desc = "Open Changed File",
		},

		{ "<leader>l", group = "LSP" },
		{
			"<leader>lI",
			"<cmd>Mason<cr>",
			desc = "Mason",
		},
		{
			"<leader>ld",
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			desc = "Document Diagnostics",
		},
		{
			"<leader>lw",
			"<cmd>Telescope diagnostics<cr>",
			desc = "Workspace Diagnostics",
		},
		{
			"<leader>li",
			"<cmd>LspInfo<cr>",
			desc = "Info",
		},

		{ "<leader>s", group = "Search" },
		{
			"<leader>sc",
			"<cmd>Telescope colorscheme<cr>",
			desc = "Colorscheme",
		},
		{
			"<leader>sh",
			"<cmd>Telescope help_tags<cr>",
			desc = "Find Help",
		},
		{
			"<leader>sk",
			"<cmd>Telescope keymaps<cr>",
			desc = "Keymaps",
		},
		{
			"<leader>sR",
			"<cmd>Telescope registers<cr>",
			desc = "Registers",
		},

		{ "<leader>t", group = "Terminal" },
		{
			"<leader>tf",
			"<cmd>ToggleTerm direction=float<cr>",
			desc = "Float",
		},
		{
			"<leader>th",
			"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
			desc = "Horizontal",
		},
		{
			"<leader>tv",
			"<cmd>ToggleTerm size=80 direction=vertical<cr>",
			desc = "Vertical",
		},
	},
})
