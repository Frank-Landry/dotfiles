" Inline Git Blame
Plug 'f-person/git-blame.nvim'

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'

" Vim Commentary
Plug 'tpope/vim-commentary'

" Emmet
Plug 'mattn/emmet-vim'

" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Terminal
Plug 'voldikss/vim-floaterm'

" Web Dev Icons
Plug 'kyazdani42/nvim-web-devicons'

" Lualine
Plug 'nvim-lualine/lualine.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'folke/trouble.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'tami5/lspsaga.nvim', { 'branch': 'nvim6.0'}

" One Dark Pro Theme
Plug 'olimorris/onedarkpro.nvim'

" Smooth Scroll
Plug 'karb94/neoscroll.nvim'

" Config: f-person
let g:gitblame_enabled = 1
let g:gitblame_highlight_group = "FPerson"
let g:gitblame_date_format = '%r'


" Config: Floaterm
let g:floaterm_width=0.9
let g:floaterm_height=0.9
let floaterm_title='($1/$2)'
