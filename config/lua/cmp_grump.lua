
--- Configuration for LSP, formatters, and linters.
local nvim_lsp = require("lspconfig")
local cmp = require("cmp")
local luasnip = require('luasnip')
local lspkind = require('lspkind')
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local builtin = require('telescope.builtin')
local util = require('lspconfig.util')
--require("cmp_nvim_lsp").setup()
require("mason").setup()
require("mason-lspconfig").setup()
-- short cut methods.
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  print('Current Client: '..client.name)
end

cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        --completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
	      ['<CR>'] = cmp.mapping.confirm({select = true})
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
	      --{ name = 'nvim_lua' },
        { name = 'luasnip' }, -- For luasnip users.
	      { name = 'nvim_lsp_signature_help' },
      }, {
        { name = 'buffer' },
      }),
      formatting = {
	      format = lspkind.cmp_format {
		      with_text = true,
		      dup = 0,
		      menu = {
			      intelephense = "[intelph]",
			      buffer = "[buf]",
			      nvim_lsp = "[LSP]",
			      nvim_lua = "[nvlua]",
			      path = "[path]",
			      luasnip = "[luasnip]",
		      }
	      }
      },
      expiremental = {
	      native_menu = false,
	      ghost_text = true
      }
    })


cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline {},
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	}),
})

nvim_lsp.marksman.setup {
  capabilities = capabilities
}


-- PHP
nvim_lsp.intelephense.setup {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php" },
    root_dir = function(pattern)
      local cwd = vim.loop.cwd()
      local root = util.root_pattern('index.php')(pattern)
      -- prefer cwd if root is a descendant
      return util.path.is_descendant(cwd, root) and cwd or root 
    end,
    documentRoot = "../../../core/",
    includePaths = {
      "/vendor/*",
      "../../../web/core/"
    },
    capabilities = capabilities
}



nvim_lsp.diagnosticls.setup {
  on_attach = on_attach,
  --filetypes = vim.tbl_keys(filetypes),
  init_options = {
    --filetypes = filetypes,
--    linters = linters,
  },
}
require("telescope").setup {}
require("telescope").load_extension "ui-select"
