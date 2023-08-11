" Mappings
"
let mapleader = '\'

" Mappings: telescope
nnoremap <leader><leader>v :Telescope sourcery<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>p <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>e <cmd>lua require('telescope.builtin').oldfiles()<cr>
" Mappings: lsp
nnoremap <leader>app <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>d <cmd>lua vim.lsp.buf.definition()<cr>
nnoremap <leader>rf <cmd>lua vim.lsp.buf.references()<cr>
nnoremap <leader>im <cmd>lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>ds <cmd>lua vim.lsp.buf.document_symbol()<cr>
nnoremap <leader>dg :Telescope diagnostics bufnr=0<cr>
" Mappings: Debugger DAP
nnoremap so <cmd>lua require'dap'.step_over()<cr>
nnoremap so <cmd>lua require'dap'.step_into()<cr>
nnoremap co <cmd>lua require'dap'.continue()<cr>
nnoremap tb <cmd>lua require'dap'.toggle_breakpoint()<cr>
nnoremap ro <cmd>lua require'dap'.repl.open()<cr>
nnoremap <leader>duo <cmd>lua require'dapui'.open()<cr>
nnoremap <leader>duc <cmd>lua require'dapui'.close()<cr>
nnoremap <leader>dt <cmd>lua require'dapui'.toggle()<cr>
