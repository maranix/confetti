--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- Add additional capabilities supported by nvim-cmp
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

local lsp = require('lspconfig')
local util = require('lspconfig/util')
-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
  }
}


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, buffer)
  -- Mappings.
  
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local opts = { noremap=true, silent=true }
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '<leader>df', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<leader>db', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)


  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = 0 })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set('n', 'rn', vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, { buffer = 0 })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = 0 })

  -- Autoformatting based on LSP
  if client.server_capabilities.documentFormattingProvider then
		vim.cmd([[
			augroup formatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
				autocmd BufWritePre <buffer> lua OrganizeImports(1000)
			augroup END
		]])
	end
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
-- C, C++, ObjC, ObjC++, cuda LSP
--
lsp.clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

--
-- Golang LSP Configs
--
lsp.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,

  cmd = { "gopls", "serve" },
  filetypes = {"go", "gomod"},
  flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}

--
-- Flutter Development Lsp Config
--
lsp.dartls.setup {
  capabilities = capabilities,
  on_attach = on_attach,

  init_options = {
    flutterOutline = true,
  }
}


--
-- Rust Development Configs
--
lsp.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

--
-- Web Development LSP Configs
--

-- CSSLS (Language Server for CSS)
lsp.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,

}

-- HTML LSP
lsp.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Typescript/Javascript LSP
lsp.tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- TailwindCSS LSP
require'lspconfig'.tailwindcss.setup{
  capabilities = capabilities,
  on_attach = on_attach,

  classAttributes = { 'class', 'className' },
  lint = {
      cssConflict = "warning",
      invalidApply = "error",
      invalidConfigPath = "error",
      invalidScreen = "error",
      invalidTailwindDirective = "error",
      invalidVariant = "error",
      recommendedVariantOrder = "warning"
    },
  rootPatterns = {'tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts'}
}
