local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')
local util = require("lspconfig/util")
local luasnip = require("luasnip")
local cmp = require("cmp")

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
  -- Mappings
  -- LSP
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

  -- code action
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action , opts)

  -- rename
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

  -- Autoformatting based on LSP
  if not (client.name == 'tsserver') then
    if client.name == 'eslint' then
      vim.cmd([[
        augroup eslintFormat
          autocmd! * <buffer>
          autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
        augroup END
      ]])
    end

    if client.server_capabilities.documentFormattingProvider then
        vim.cmd([[
          augroup formatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
            autocmd BufWritePre <buffer> lua OrganizeImports(1000)
          augroup END
        ]])
    end
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
-- Lua LSP
--
lspconfig.sumneko_lua.setup{}

--
-- C, C++, ObjC, ObjC++, cuda LSP
--
lspconfig.clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

--
-- Golang LSP Configs
--
lspconfig.gopls.setup {
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
lspconfig.dartls.setup {
  capabilities = capabilities,
  on_attach = on_attach,

  init_options = {
    flutterOutline = true,
  }
}

--
-- Rust Development Configs
--
lspconfig.rust_analyzer.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Web/Javascript LSP Configurations
lspconfig.tsserver.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.eslint.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.emmet_ls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.cssls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.html.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig.tailwindcss.setup{
  capabilities = capabilities,
  on_attach = on_attach,

  settings = {
      tailwindCSS = {
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
    }
  }
}
