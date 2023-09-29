 set number
 set showmatch
 set tabstop=2
 set shiftwidth=2
 set expandtab
 set background=dark

 call plug#begin()
 source ~/.config/nvim/dotfiles/plugins.vim
 call plug#end()
 set completeopt=noinsert,menuone,noselect
 " lua file inclusion from config/lua 
 luafile ~/.config/nvim/dotfiles/config/lua/ntreesitter.lua
 luafile ~/.config/nvim/dotfiles/config/lua/lualine.lua
 luafile ~/.config/nvim/dotfiles/config/lua/emmet.lua
 luafile ~/.config/nvim/dotfiles/config/lua/intelephense.lua
 luafile ~/.config/nvim/dotfiles/config/lua/cmp.lua
 luafile ~/.config/nvim/dotfiles/config/lua/dap.lua
 luafile ~/.config/nvim/dotfiles/config/lua/comment.lua
 luafile ~/.config/nvim/dotfiles/config/lua/dashboard.lua
 luafile ~/.config/nvim/dotfiles/config/lua/tslsp.lua
 luafile ~/.config/nvim/dotfiles/config/lua/todo-comments.lua
 source ~/.config/nvim/dotfiles/mappings.vim
 "luafile ~/.config/nvim/dotfiles/config/lua/intelephense.lua
 "luafile ~/.config/nvim/dotfiles/config/lua/phpactor.lua

 "autocmd BufEnter * call ncm2#enable_for_buffer()
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! link CmpItemKindInterface CmpItemKindVariable
highlight! link CmpItemKindText CmpItemKindVariable
" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! link CmpItemKindMethod CmpItemKindFunction
" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! link CmpItemKindProperty CmpItemKindKeyword
highlight! link CmpItemKindUnit CmpItemKindKeyword
