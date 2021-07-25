command Locate cd %:p:h
command -nargs=1 IndentWidth setlocal tabstop=<args> shiftwidth=<args>
command -nargs=0 IndentSpace call util#toggle_indent_space()
