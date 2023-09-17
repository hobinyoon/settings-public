" Referenced https://amix.dk/vim/vimrc.html
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 9 lines to the cursor - when moving vertically using j/k
"   Top/bottom margin
set scrolloff=9

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Precede each line with its line number.
set number

" Height of the command bar
set cmdheight=1

" Allow backspacing over everything in insert mode, including automatically
" inserted indentation, line breaks and start of insert
" [https://stackoverflow.com/a/11560415/5787711].
set backspace=eol,start,indent

" Case sensitive searching when it contains an uppercase letter
" [https://stackoverflow.com/a/47975944/5787711]
set ignorecase
set smartcase

" Highlight search results
set hlsearch

" While typing a search command, show where the pattern, as it was typed so
" far, matches.
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" "Magic" regular expression
set magic

" Show matching brackets when text indicator is over them.  Blink for 0.2
" seconds.
set showmatch
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Fix the dark blue color.
"   Note that it makes the text bold. To fix it, on the Mac Terminal option,
"   disable (Use bold fonts) and enable (Use bright colors for bold text).
" set background=dark

" Note: When some colors are too dark, you can adjust them in the Mac Terminal
" --> Settings --> Profiles --> ANSI colors.
" colorscheme industry
colorscheme default


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set softtabstop=2

set textwidth=140

set autoindent
set smartindent

" Wrap lines
set wrap


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"   fugitive is a Vim plugin for Git
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ [Pos=%04l,%04v\ %o\ %p%%]\ %{fugitive#statusline()}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Some macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grep source code for current word
noremap <leader>g :!grepsrc <cword><CR>

" split tab and follow the tag
noremap <leader>f :tab split<CR>g]

" Shift arrow for moving around tabs
"   <C-Right> doesn't work with my environment
nnoremap <S-Right> gt
nnoremap <S-Left> gT

" quit all
noremap ]q :qa<CR>

" substitute
noremap <leader>s :%s/\<<c-r>=expand("<cword>")<cr>\>/<c-r>=expand("<cword>")<cr>/gce \| update
"noremap <leader>S :split<CR> :argdo %s/\<<c-r>=expand("<cword>")<cr>\>/<c-r>=expand("<cword>")<cr>/gce \| update

" Scroll up with shift+e
noremap <S-e> <C-e>

function SetExpandTab2()
	filetype indent on
	"set nosmartindent
	set autoindent
	set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	" disable case insensitive search
	"set noic
	set textwidth=80
endfunction
au BufRead,BufNewFile ~/* call SetExpandTab2()
" Can be customized per path expression, such as ~/work/mutant*

" No swap file: https://vi.stackexchange.com/questions/177
set noswapfile
