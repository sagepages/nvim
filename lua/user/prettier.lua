local prettier = require("prettier")

prettier.setup({
	bin = "prettier", -- or `prettierd`
	filetypes = {
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
    "lua",
    "golang",
		"less",
		"markdown",
		"scss",
		"typescript",
		"typescriptreact",
		"yaml",
	},
})
