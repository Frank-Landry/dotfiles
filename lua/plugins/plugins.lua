return {
  { 'f-person/git-blame.nvim' },
  { 'folke/todo-comments.nvim' },
  { 'tpope/vim-unimpaired' },
  { 'tpope/vim-commentary' },
  { 'numToStr/Comment.nvim' },
  { 'mattn/emmet-vim' },
  { 'nvim-lua/plenary.nvim' },
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
      require('mason').setup({})
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = {
          "lua_ls",
          "intelephense",
          "bashls",
          "html",
          "emmet_ls"
        }
      }
    end
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        lua_ls = {},
        intelephense = {
          root_dir = function(pattern)
            local util = require 'lspconfig.util'
            local cwd = vim.loop.cwd()
            local root = util.path("composer.json", ".git", "index.php")(pattern)

            return util.path.is_descendant(cwd, root) and cwd or root
          end,
        },
        bashls = {},
        html = {},
        emmet_ls = {},
      },
    },
    config = function()
      local lspconfig = require('lspconfig')
      lspconfig.lua_ls.setup({
        on_attach = function()
          print('Lua LS Attached')
        end
      })
      lspconfig.intelephense.setup({
        on_attach = function()
          vim.keymap.set("n", "<leader>ft", function() vim.lsp.buf.format() end)
          print('Intelephense Attached')
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
      lspconfig.emmet_ls.setup({
        filetypes = { "css", "html", "less", "sass", "scss", "pt" },
        on_attach = function()
          print('Emmet LS Attached')
        end
      })
      lspconfig.ts_ls.setup({
        filetypes = {
          "javascript", "ts"
        },
        on_attach = function()
          print("Tsserver Attached")
          vim.keymap.set("n", "<leader>ft", function()
            vim.lsp.buf.format()
          end)
        end
      })
      lspconfig.html.setup({
        filetypes = { "html", "twig.html", "pt" },
        on_attach = function()
          vim.keymap.set("n", "<leader>ft", function()
            vim.lsp.buf.format()
          end)
        end
      })
    end
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'enter' },

      cmdline = {
        enabled = true,
        keymap = { preset = 'inherit' },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "lua" }
    },
    opts_extend = { "sources.default" }
  },
  { 'neovim/nvim-lsp' },
  { 'nvim-treesitter/nvim-treesitter', },
  { 'ncm2/ncm2' },
  { 'roxma/nvim-yarp' },
  { 'nvim-lua/lsp-status.nvim' },
  { 'L3MON4D3/LuaSnip' },
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
  {
    'mfussenegger/nvim-dap',
    recommended = true,
    desc = "Debugging support. Requires adapters to be configured",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      { "theHamsta/nvim-dap-virtual-text", opts = {}, },
    },
    keys = {
      { "<leader>d",  "",                                                                                   desc = "+debug",                 mode = { "n", "v" } },
      { "<leader>dt", function() require('dapui').toggle({}) end,                                           desc = "Dap UI" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,                                             desc = "Continue" },
      { "<leader>da", function() require("dap").continue({ before = get_args }) end,                        desc = "Run with Args" },
      { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end,                                                desc = "Go to Line (No Execute)" },
      { "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
      { "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end,                                             desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end,                                            desc = "Step Over" },
      { "<leader>dp", function() require("dap").pause() end,                                                desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
    },
  },
  { 'nvim-neotest/nvim-nio' },
  { 'rcarriga/nvim-dap-ui' },
  { 'theHamsta/nvim-dap-virtual-text' },
  { 'nvimdev/dashboard-nvim' },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {}
  }
}
