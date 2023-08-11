--- Configuration for icons
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
--- Configuration for LSP, formatters, and linters.
local nvim_lsp = require("lspconfig")
local cmp = require("cmp")
local luasnip = require('luasnip')
local lspkind = require('lspkind')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
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
  -- DEBUGGING KEYBINDS
  buf_set_keymap('n', '<space>sd', "<cmd>lua require'dap'.continue()<CR>", opts)
  buf_set_keymap('n', '<F10>', "<cmd>lua require'dap'.step_over()<CR>", opts)
  buf_set_keymap('n', '<F11>', "<cmd>lua require'dap'.step_into()<CR>", opts)
  buf_set_keymap('n', '<F12>', "<cmd>lua require'dap'.step_out()<CR>", opts)
  buf_set_keymap('n', '<space>b', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
  buf_set_keymap('n', '<space>B', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
  buf_set_keymap('n', '<space>od', "<cmd>lua require'dapui'.open()<CR>", opts)
  buf_set_keymap('n', '<space>cd', "<cmd>lua require'dapui'.close()<CR>", opts)
  -- TELESCOPE KEYBINDS
  --buf_set_keymap('n', '<space>gf', builtin.git_files, opts)

--  print('MAKE SURE TO COMMENT YOUR METHODS TO GET -> Completion WORKING')
end

cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        --completion = cmp.config.window.bordered(),
        --documentation = cmp.config.window.bordered(),
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
			      nvim_lsp = "[LSP]",
            buffer = "[BUF]",
			      nvim_lua = "[nvlua]",
			      path = "[path]",
			      luasnip = "[luasnip]",
		      }
	      }
      },
      expiremental = {
	      native_menu = true, --false,
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
--nvim_lsp.intelephense.setup {
--    cmd = { "intelephense", "--stdio" },
--    filetypes = { "php", "module", "phtml", "install" },
--    root_dir = function(pattern)
--      local cwd = vim.loop.cwd()
--      local root = util.root_pattern('index.php')(pattern)
--      -- prefer cwd if root is a descendant
--      return util.path.is_descendant(cwd, root) and cwd or root 
--    end,
--    documentRoot = {"../../../core/", "index.php"},
--    includePaths = {
--      "/vendor/*",
--      "../../../web/core/"
--    },
--    capabilities = capabilities
--}



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
