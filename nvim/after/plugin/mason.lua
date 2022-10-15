require("mason").setup({
    ui = {
	icons = {
	    package_installed = "✓",
	    package_pending = "➜",
	    package_uninstalled = "✗"
	}
    }
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"clangd",
		"cssls",
		"eslint-lsp",
		"emmet_ls",
		"gopls",
		"html",
    "prettierd",
		"tailwindcss",
		"tsserver",
		"rust_analyzer",
		"sumneko_lua",
	},
	automatic_installation = true,
})
