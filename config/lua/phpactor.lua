-- PHPACTOR setup
local lspconfig = require('lspconfig')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits'
  }
}

-- php specific keymaps
local opts = { silent = true }

vim.api.nvim_set_keymap('n', 'tf', [[:call phpactor#Transform()<CR>]], opts)
vim.api.nvim_set_keymap('n', 'ce', [[:call phpactor#ClassExpand()<CR>]], opts)
vim.api.nvim_set_keymap('n', 'cm', [[:call phpactor#ContextMenu()<CR>]], opts)

-- make $ part of keyword
vim.api.nvim_exec( [[autocmd FileType php set iskeyword+=$]], false)

lspconfig.phpactor.setup{
  cmd = { "php", "-dxdebug.mode=off", '/Users/franklandry/vendor/bin/phpactor', 'language-server'},
  capabilities = capabilities,
  on_attach = on_attach,
}
