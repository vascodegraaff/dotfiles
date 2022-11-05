syntax on
imap jk <Esc>
set ruler               " Show the line and column numbers of the cursor.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set modeline            " Enable modeline.
" set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)
" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.
if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrollin.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.
set noerrorbells                " No beeps
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup            	" Don't create annoying backup files
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Do not show matching brackets by flickering
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent
set smartindent
set tabstop=4 shiftwidth=4 expandtab
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).
set mouse=a             " Enable mouse usage.

set number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" create new terminal and split when using leader t
nmap <Leader>t <C-\><C-n><C-w><C-v> :terminal <CR> call feedkeys('i')


" Leader key is like a command prefix.
let mapleader= '\'
let maplocalleader='\'

let g:python_host_prog="/opt/homebrew/Cellar/python@3.10/3.10.6_1/Frameworks/Python.framework/Versions/3.10/lib/python3.10"

let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1

" set cursorcolumn
vmap <BS> x

" cd ~/.config/nvim/spell
" wget http://ftp.vim.org/vim/runtime/spell/pt.utf-8.spl
" set spell spelllang=pt_pt
" zg to add word to word list
" zw to reverse
" zug to remove word from word list
" z= to get list of possibilities
set spellfile=~/.config/nvim/spellfile.add
" set nospell
"


" Plugins here
call plug#begin('~/.config/nvim/plugged')

" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'Shougo/deoplete.nvim'
" Plug 'Valloric/YouCompleteMe'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Nice status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/nerdtree'
"Plug 'terryma/vim-multiple-cursors'
Plug 'dracula/vim'
"Plug 'Mofiqul/dracula.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'github/copilot.vim'
Plug 'junegunn/fzf' , {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'christoomey/vim-system-copy'
Plug 'akinsho/toggleterm.nvim'
Plug 'thaerkh/vim-workspace'

Plug 'dracula/vim', { 'as': 'dracula' }
"Telescope - file and definition finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Syntax hightlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"
Plug 'vim-test/vim-test'

call plug#end()


" Dracula settings

augroup dracula_customization
  au!
   let g:dracula_colorterm = 0
augroup END




" Buffer handling
nnoremap <C-b> :bp<CR>
nnoremap <C-n> :bn<CR>
nnoremap <C-d> :bd<CR>
nnoremap <Leader>b :ls<CR>:b<Space>

" Python config
let g:python3_host_prog = '/opt/homebrew/bin/python3'


" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-pyright',
  \ 'coc-java',
  \ 'coc-phpls',
  \ 'coc-go'
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

"vim workspace"
let g:workspace_autosave_always = 1

"deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
if has("gui_running")
    inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
else
    inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
endif

" UltiSnips config
"inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  " set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+
endif

" nerdtree config
nnoremap <Space>n :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50

" airline settings
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_powerline_fonts=1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_powerline_fonts=1
let g:airline_theme='dracula'
" Multicursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-e>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_quit_key='<Esc>'

" YouCompleteMe
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_min_num_of_chars_for_completion = 1

" Other
set mouse=
set list

" Theme
" let g:lightline = {'colorscheme': 'tokyonight'}
" colorscheme tokyonight
colorscheme dracula
color dracula
" colorscheme monokai
" highlight SignColumn guibg=#272822
let g:rehash256 = 1
" let g:molokai_original=1
let NERDTreeIgnore = ['_site']

" Buffer handling
nmap L :let &number=1-&number<CR>
" nmap <leader>l :bnext<CR>
" nmap <c-h> :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nmap <leader>0 :set invnumber<CR>
nmap <C-b> :bp<Enter>
nmap <C-n> :bn<Enter>
nmap <C-x> :bd<Enter>
" map :q to byffer delete
" http://stackoverflow.com/questions/7513380/vim-change-x-function-to-delete-buffer-instead-of-save-quit
cnoreabbrev <expr> q getcmdtype() == ":" && (getcmdline() == 'q' && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1) ? 'bd' : 'q'g

" go to definition
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

" Telescope find files and find functions
nnoremap <C-p> :GitFiles<CR>
" nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-f> :Telescope live_grep<CR>

" Use system clipboard
"
set clipboard=unnamedplus

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" NVIM TODO list
" 1 - quickswitch between terminal mode node code
" 2 - code formatter
" 3 - make sure language support all works
" 4 - 


"COC language server and extensions
"
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


lua << EOF
require'nvim-treesitter.configs'.setup{
    highlight = {
        enable = true
    },
    auto_install = true,
    ignore_install = {
        "phpdoc",
    },
ensure_install = {
    "all",
    },
}
EOF
