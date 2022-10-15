require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'bash',
    'c',
    'comment',
    'cpp',
    'css',
    'dart',
    'dockerfile',
    'go',
    'gomod',
    'html',
    'javascript',
    'json',
    'lua',
    'rust',
    'sql',
    'tsx',
    'typescript',
    'yaml',
	},
	sync_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	}
})
