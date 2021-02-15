set exrc " Wont open project .nvimrc without this here

" Leader
let mapleader = " "

" this will install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif


call plug#begin('~/.vim/plugged')
" Yes, I am a sneaky snek now
Plug 'ambv/black'

" Neovim lsp Plugins (Language Server Plugins)
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim' 
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" NERDTree
Plug 'https://github.com/scrooloose/nerdtree.git'

" AirLine (status bar)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" TmuxLine
Plug 'edkolev/tmuxline.vim'

" Tag Bar
" sudo apt-get install 
Plug 'https://github.com/majutsushi/tagbar'

" Ale Linting
" Plug 'dense-analysis/ale'

" Coc ( Conquor of Completion )
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Polyglot
Plug 'sheerun/vim-polyglot'

call plug#end()
