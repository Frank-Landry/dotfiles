return {
  { 'f-person/git-blame.nvim' },
  { 'folke/todo-comments.nvim' },
  { 'jiangmiao/auto-pairs' },
  { 'tpope/vim-unimpaired' },
  { 'tpope/vim-commentary' },
  { 'numToStr/Comment.nvim' },
  { 'mattn/emmet-vim' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'voldikss/vim-floaterm' },
  { 'nvim-tree/nvim-web-devicons' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = {
          {
            theme = onedark
          },
        }
      })
    end
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'intelephense',
          'lua_ls',
          'yamlls',
          'perlnavigator',
          'bashls'
        }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.intelephense.setup({
        on_attach = function()
          print('Intelephense Attached')
        end
      })
      lspconfig.lua_ls.setup({
        on_attach = function()
          print('Lua Language Server Attached')
        end
      })
      lspconfig.yamlls.setup({
        on_attach = function()
          print('YAML Language Server Attached')
        end
      })
      lspconfig.perlnavigator.setup({
        on_attach = function()
          print('Perl Navigator Server Attached')
        end
      })
      lspconfig.bashls.setup({
        on_attach = function()
          print('BashLS Server Attached')
        end
      })
    end
  },
  { 'neovim/nvim-lsp' },
  { 'nvim-treesitter/nvim-treesitter', },
  { 'ncm2/ncm2' },
  { 'roxma/nvim-yarp' },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      vim.opt.completeopt = { "menu", "menuone", "noselect" }

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip" }, -- For luasnip users.
          -- { name = "orgmode" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  { 'nvim-lua/lsp-status.nvim' },
  { 'L3MON4D3/LuaSnip' },
  { 'saadparwaiz1/cmp_luasnip' },
  {
    'olimorris/onedarkpro.nvim',
    config = function()
      require('onedarkpro').load()
    end
  },
  { 'mvpopuk/inspired-github.vim' },
  {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').load()
    end
  },
  {
    'sonph/onehalf',
    lazy = false,
    priority = 1000
  },
  { 'karb94/neoscroll.nvim' },
  { 'onsails/lspkind.nvim' },
  { 'tjdevries/colorbuddy.nvim' },
  { 'artempyanykh/marksman' },
  { 'mfussenegger/nvim-dap' },
  { 'nvim-neotest/nvim-nio' },
  { 'rcarriga/nvim-dap-ui' },
  { 'theHamsta/nvim-dap-virtual-text' },
  { 'nvim-telescope/telescope-dap.nvim' },
  { 'nvimdev/dashboard-nvim' },
}
