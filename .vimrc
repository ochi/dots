" konfig dla vim
set nocompatible    " Use Vim defaults instead of 100% vi compatibility
set backupcopy=yes
set viminfo='20,\"50,:20
set history=500
syntax on
set showcmd     " Show (partial) command in status line.
" zaeksportowane z trustixa
set nomodeline
set bs=2                " allow backspacing over everything in insert mode
" tabulatory wstawia spacje zamiast tabow
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" podswietlanie skladni na czarnym
set bg=dark
" bez automatycznych wciec
set noai
set paste
" sprytne wyszukiwanie pomija wielkosc liter
set ignorecase
" gdy wszystkie litery sa male przy wyszukiwaniu to pomija wielkosc liter
" gdy pojawiaja sie duze znaki to nie jest pomijana wielkosc liter
set smartcase
" Always show status line
set ls=2
if has('statusline')
   " Status line detail:
   " %f     file path
   " %y     file type between braces (if defined)
   " %([%R%M]%)   read-only, modified and modifiable flags between braces
   " %{'!'[&ff=='default_file_format']}
   "        shows a '!' if the file format is not the platform
   "        default
   " %{'$'[!&list]}  shows a '*' if in list mode
   " %{'~'[&pm=='']} shows a '~' if in patchmode
   " (%{synIDattr(synID(line('.'),col('.'),0),'name')})
   "        only for debug : display the current syntax item name
   " %=     right-align following items
   " #%n    buffer number
   " %l/%L,%c%V   line number, total number of lines, and column number
   function SetStatusLineStyle()
      if &stl == '' || &stl =~ 'synID'
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=#%n %l/%L,%c%V "
      else
         let &stl="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]} (%{synIDattr(synID(line('.'),col('.'),0),'name')})%=#%n %l/%L,%c%V "
      endif
   endfunc
   " Switch between the normal and vim-debug modes in the status line
   nmap _ds :call SetStatusLineStyle()<CR>
   call SetStatusLineStyle()
   " Window title
   if has('title')
      set titlestring=%t%(\ [%R%M]%)
   endif
endif

" moje dodatkowe komendy
set wildmenu
set wildmode=list:longest,full

" use <F6> to toggle line numbers
nmap <silent> <F6> :set number!<CR>
:hi LineNr ctermfg=darkgray ctermbg=black

" use <F7> <F8> to move between tabs
nmap <silent> <F7> :tabp<CR>
nmap <silent> <F8> :tabn<CR>

" save & execute
:map <F2> <Esc>:w<CR>:!php %<CR>

" page down with <Space>
nmap <Space> <PageDown>

" KOMENDY WYKONYWANE ZAWSZE PO URUCHOMIENIU PLIKU
:set ruler
:set number
:set hlsearch
