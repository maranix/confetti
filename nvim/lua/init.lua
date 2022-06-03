--
-- init.lua
--

--
-- Global LSP config
--
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, buffer)
	-- Keymaps
			vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer = 0})
		vim.keymap.set("n", "<leader>db", vim.diagnostic.goto_prev, {buffer = 0})
		vim.keymap.set("n", "<leader>di", "<cmd>Telescope diagnostics<cr>", {buffer = 0})
	vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
	vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
	vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
	vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
	vim.cmd([[
			augroup formatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
				autocmd BufWritePre <buffer> lua OrganizeImports(1000)
			augroup END
		]])
end

-- Organize imports function
-- https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-902680058
function OrganizeImports(timeoutms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
end

--
-- Load language specific settings modules
--

-- Go LSP
require('lspconfig').gopls.setup {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},

}

-- Dart LSP 
require'lspconfig'.dartls.setup{
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Rust LSP
require("lspconfig").rust_analyzer.setup{
	capabilities = capabilities,
	on_attach = on_attach,
}

-- CCLS LSP
require'lspconfig'.ccls.setup{
	capabilities = capabilities,
	on_attach = on_attach,
}

-- Typescript & Javascript LSP
require'lspconfig'.tsserver.setup{
	capabilities = capabilities,
	on_attach = on_attach,
}

-- 
-- Tree sitter settings
--
require'nvim-treesitter.configs'.setup {
  highlight = {
			-- `false` will disable the whole extension
			enable = true,
			additional_vim_regex_highlight = false,
	},
}

--
-- Auto-compelete global settings
--

vim.opt.completeopt = {"menu", "menuone", "noselect"}

local cmp = require'cmp'
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

