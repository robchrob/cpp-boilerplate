" PLEASE REMEMBER TO ADD set exrc to your vimrc!

map Q ggVG:pyf /usr/share/clang/clang-format.py<cr>:%!sed 's/ *; *$/ ;/'<cr>:w<cr>
set noexpandtab

highlight ColorColumn ctermbg=52| " set higlight to dark red
call matchadd('ColorColumn', '\%82v', 100) " highlight 81 character of line
set numberwidth=2

filetype indent on " set indent depending on filetype
set autoindent  " auto indent
set tabstop=4   " The width of a TAB is set to 4.
set softtabstop=4   " Sets the number of columns for a TAB
set shiftwidth=4    " Indents will have a width of 4
set expandtab   " Expand TABs to spaces

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"| " trailing whitespaces
set list " enable trailing whitespaces detection

let &path.="/usr/include,lib/catch/include,lib/spdlog/include,"
set makeprg=./compile.sh
