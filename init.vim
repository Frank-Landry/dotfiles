 set number
 set showmatch
 set tabstop=2
 set shiftwidth=2
 set expandtab

 call plug#begin()
 source ~/.config/nvim/dotfiles/plugins.vim
 call plug#end()
 set completeopt=noinsert,menuone,noselect
 
 luafile ~/.config/nvim/dotfiles/config/lua/ntreesitter.lua
 luafile ~/.config/nvim/dotfiles/config/lua/lualine.lua
 luafile ~/.config/nvim/dotfiles/config/lua/cmp_grump.lua
 "luafile ~/.config/nvim/dotfiles/config/lua/intelephense.lua
 "luafile ~/.config/nvim/dotfiles/config/lua/phpactor.lua

 "autocmd BufEnter * call ncm2#enable_for_buffer()

