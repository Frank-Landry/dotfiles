"Git-Blame
Plug 'f-person/git-blame.nvim'
" Todo comment highlighting
Plug 'folke/todo-comments.nvim'

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'

" Vim Commentary
Plug 'tpope/vim-commentary'

" Comments
Plug 'numToStr/Comment.nvim'
" Emmet
Plug 'mattn/emmet-vim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'

" Terminal
Plug 'voldikss/vim-floaterm'

" Web Dev Icons
Plug 'nvim-tree/nvim-web-devicons'

" Lualine
Plug 'nvim-lualine/lualine.nvim'

" LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'neovim/nvim-lsp'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'phpactor/phpactor', {'do': 'composer install --no-dev -o'}
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/ncm2-phpactor'
"Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" One Dark Pro Theme
Plug 'olimorris/onedarkpro.nvim'
" Inspired Github Theme
Plug 'mvpopuk/inspired-github.vim'
" One dark theme
Plug 'navarasu/onedark.nvim'
" One half theme
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" Smooth Scroll
Plug 'karb94/neoscroll.nvim'
" LSP formatting
Plug 'onsails/lspkind.nvim'

" Colorbuddy
Plug 'tjdevries/colorbuddy.nvim'

Plug 'phpactor/phpactor'
Plug 'artempyanykh/marksman'
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'nvim-telescope/telescope-dap.nvim'

Plug 'rest-nvim/rest.nvim'

Plug 'nvimdev/dashboard-nvim'
" Config: Floaterm
let g:floaterm_width=0.9
let g:floaterm_height=0.9
let floaterm_title='($1/$2)'
