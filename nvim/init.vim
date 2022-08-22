source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/keys/coc-config.vim
source $HOME/.config/nvim/keys/snippets.vim

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" coc.nvim
let g:coc_global_extensions = [
      \ 'coc-tsserver',
      \'coc-prettier',
      \'coc-json',
      \'coc-vimlsp',
      \'coc-highlight',
      \'coc-eslint',
      \'coc-tslint-plugin']

let g:multi_cursor_start_word_key      = '<C-n>'

" Default fzf layout
" - Popup window (center of the screen)
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 1 } }
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'


let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Enable blinking together with different cursor shapes for insert/command mode, and cursor highlighting:
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

lua require('colorscheme')
lua require('basic')
lua require('keybindings')
lua require('plugins')
lua require('plugin-config.nvim-tree')
lua require('plugin-config.bufferline')
lua require('plugin-config.lualine')
lua require('plugin-config.telescope')
lua require('plugin-config.dashboard')
lua require('plugin-config.project')
lua require('plugin-config.nvim-treesitter')
lua require('plugin-config.indent-blankline')
lua require('plugin-config.nerdCommentor')

" lua require('plugin-config.formatter')

" lsp
" lua require('lsp.setup')
"lua require('lsp.cmp')



