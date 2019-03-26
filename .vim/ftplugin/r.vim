""""""""""
" Basics "
""""""""""
" Disable the assign operator, which automaticaly replace the "_" with " <- "
let R_assign = 2
" Start R automatically when you start editing an R script
autocmd FileType r if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
autocmd FileType rmd if string(g:SendCmdToR) == "function('SendCmdToR_fake')" | call StartR("R") | endif
" Quit R automatically when quiting Vim
autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif

""""""""""""
" Mappings "
""""""""""""
" Shiny mappings
" Initialize the Shiny App
nmap <LEADER>ri :RSend shiny::runApp()<CR>
" Restart the Shiny App
nmap <LEADER>rr :RStop<CR>:RSend shiny::runApp()<CR>
" Stop the Shiny App
nmap <LEADER>rs :RStop<CR>

" Custom mappings
" Clear console
nmap <LEADER>cc :RSend cat(c("\033[2J","\033[0;0H"))<CR>
" Format code
nmap <LEADER>fc :execute ':! R -q -e "styler::style_file(path = \"'.expand('%:p').'\")"'<CR>:e<CR>
