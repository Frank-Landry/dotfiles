local lsp_config = require("lspconfig")
lsp_config.emmet_language_server.setup({
  on_attach = function(client, bufnr)
    print("emmet lsp attached")
  end,
  filetypes={"html", "css", "vue", "ts", "js", "twig", "scss", "less", "sass"},
})
