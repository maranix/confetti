return {
    cmd = { 'dart', 'language-server', '--protocol=lsp' },
    filetypes = { 'dart' },
    init_options = {
        closingLabels = true,
        flutterOutline = true,
        onlyAnalyzeProjectsWithOpenFiles = true,
        outline = true,
        suggestFromUnimportedLibraries = true
    },
    root_dir = require('lspconfig.util').root_pattern({ 'pubspec.yaml' }),
    setting = {
        dart = {
            completeFunctionCalls = true,
            showTodos = true
        }
    }
}
