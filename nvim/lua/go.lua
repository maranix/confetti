--
-- gopls Language server setup
--
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').gopls.setup {
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer = 0})
		vim.keymap.set("n", "<leader>db", vim.diagnostic.goto_prev, {buffer = 0})
		vim.keymap.set("n", "<leader>di", "<cmd>Telescope diagnostics<cr>", {buffer = 0})
		end,
	settings = {
		gopls = {
			gofumpt = true,
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}


--
-- Order imports on save, like goimports does:
--
function OrgImports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
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
