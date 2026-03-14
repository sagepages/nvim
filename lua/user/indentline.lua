local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
	return
end

ibl.setup({
	indent = {
		char = "▏",
	},
	whitespace = {
		remove_blankline_trail = true,
	},
	scope = {
		enabled = true, -- This replaces show_current_context
	},
	exclude = {
		filetypes = {
			"help",
			"packer",
			"NvimTree",
			"dashboard",
			"lspinfo",
			"checkhealth",
			"man",
			"telescope",
		},
		buftypes = { "terminal", "nofile" },
	},
})
