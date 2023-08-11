local util = require("lspconfig.util")
local nvim_lsp = require("lspconfig")
-- PHP
nvim_lsp.intelephense.setup {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php", "module", "phtml", "install" },
    root_dir = function(pattern)
      local cwd = vim.loop.cwd()
      local root = util.root_pattern('index.php')(pattern)
      -- prefer cwd if root is a descendant
      return util.path.is_descendant(cwd, root) and cwd or root 
    end,
    documentRoot = {"../../../core/", "index.php", "lib/", "includes/", "ini.php"},
    includePaths = {
      "/vendor/*",
      "../../../web/core/"
    },
    capabilities = capabilities
}

--local lspconfig = require 'lspconfig'
--lspconfig.intelephense.setup {
--  cmd = { "intelephense", "--stdio" },
--  filetypes = {"php", "*.module", "*.inc", "*.theme"},
--  root_dir = function (pattern)
--    local cwd = vim.loop.cwd();
--    local root = lspconfig.util.root_pattern("composer.json", ".git")(pattern);

    --prefer cwd if root is descendant
 --   return lspconfig.util.path.is_descendant(cwd, root) and cwd or root;
--  end;
--  root_dir = lspconfig.util.root_pattern({ "composer.json", ".git" }),
 -- settings = 
--  { 
--    intelephense = {
--      includePaths = {
--        '**/web/*',
--        '/Users/franklandry/htdocs/portal/dmv_tax_estimator/',
--      }
--    } 
--  },
--  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--  on_attach = function(_, bufnr)
--        flags = {
--          debounce_text_changes = 150,
--        }
--        vim.keymap.set("n", "K", vim.lsp.buf.hover, {
--            buffer = 0
--        })
--        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
--            buffer = 0
--        })
--        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {
--            buffer = 0
--        })
--        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
 --           buffer = 0
--        })
--        vim.keymap.set("n", "gn", vim.diagnostic.goto_next, {
--            buffer = 0
--        })
--        vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, {
--            buffer = 0
--        })
--        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, {
--            buffer = 0
--        })
--        vim.keymap.set("n", "T", "<cmd>Telescope<CR>", {})
--        vim.keymap.set("n", "<C-a>", vim.lsp.buf.code_action, {})
 --       print('Intelephense has attached successfully.')
--   end
--
--}

