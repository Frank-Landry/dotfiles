vim.keymap.set('n', '<leader>ft', function()
  vim.lsp.buf.format()
end)
