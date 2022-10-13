local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
lspkind.init()
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
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
	      { name = 'nvim_lua' },
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
			      intelephense = "[intelephense]",
            phpactor = "[phpactor]",
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

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      {
        virtual_text = false,
        signs = false,
        update_in_insert = false,
        underline = false,
        severity_sort = true
      }
    )
--vim.diagnostic.config({
--      virtual_text = false,
--      severity_sort = true,
--      float = {
--        border = 'rounded',
--        source = 'always',
--        header = '',
--        prefix = '',
--      }
--    })

    -- command line
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline {},
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	}),
})

--require('colorbuddy').setup()
--local Group = require("colorbuddy.group").Group
--local g = require("colorbuddy.group").groups
--local s = require("colorbuddy.style").styles

--Group.new("CmpItemAbbr", g.Comment)
--Group.new("CmpItemAbbrDeprecated", g.Error)
--Group.new("CmpItemAbbrMatchFuzzy", g.CmpItemAbbr.fg:dark(), nil, s.italic)
--Group.new("CmpItemKind", g.Special)
--Group.new("CmpItemMenu", g.NonText)
