require("luasnip.loaders.from_vscode").lazy_load()

-- Extend dart filetype to include snippets from flutter framework
require("luasnip").filetype_extend("dart", {"flutter"})
