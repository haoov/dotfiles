" Name:			haoov
" Description:	My custum vim theme
" Author:		haoov
" Maintainer:	haoov

set background=dark

" Reset all hilights to default
hi clear
if exists("syntax_on")
	syntax reset
endif

" Set the colorscheme name
let g:color_name = 'haoov'

" Colors
let s:bg0 = "#24292E"
let s:bg1 = "#2F363D"
let s:bg2 = "#2B3036"
let s:bg3 = "#2F363D"
let s:bg4 = "#444d56"
let s:bg5 = "#586069"
let s:bg6 = "#1F2428"

let s:fg0 = "#E1E4E8"
let s:fg1 = "#6A737D"

let s:blue0 = "#9ECBFF"
let s:blue1 = "#C8E1FF"
let s:blue2 = "#79B8FF"

let s:red0 = "#F97583"

let s:orange0 = "#FFAB70"

" Function to use variable in hilight command
function s:set_hi(group, fg, bg, att)
	let l:fg = " guifg=" . a:fg
	let l:cfg = " guifg=" . a:fg
	let l:bg = " guibg=" . a:bg
	let l:cbg = " guibg=" . a:bg
	let l:att = " gui=" . a:att
	let l:catt = " cterm=" . a:att
	execute "hi " . a:group . l:fg . l:cfg . l:bg . l:cbg . l:att . l:catt
endfunction

call s:set_hi("Normal", s:fg0, s:bg0, "NONE")
call s:set_hi("Comment", s:fg1, s:bg0, "italic")

call s:set_hi("String", s:blue0, s:bg0, "NONE")
call s:set_hi("Statement", s:blue2, s:bg0, "NONE")
call s:set_hi("Identifier", s:red0, s:bg0, "NONE")
call s:set_hi("Type", s:orange0, s:bg0, "NONE")
hi! link Constant Statement
hi! link PreProc Statement

hi! link CursorLineNr Normal
call s:set_hi("LineNr", s:fg1, s:bg0, "NONE")

call s:set_hi("CursorLine", "NONE", s:bg2, "NONE")
hi! link CursorColumn CursorLine
hi! link ColorColumn CursorLine

call s:set_hi("Search", "NONE", s:bg4, "NONE")
call s:set_hi("CurSearch", "NONE", s:bg5, "NONE")
hi! link IncSearch Search

call s:set_hi("Pmenu", s:fg0, s:bg6, "NONE")
call s:set_hi("PmenuSel", s:fg0, s:bg4, "NONE")
call s:set_hi("PmenuMatch", s:orange0, s:bg6, "NONE")
call s:set_hi("PmenuMatchSel", s:orange0, s:bg4, "NONE")

call s:set_hi("TabLine", s:fg0, s:bg6, "NONE")
hi! link TabLineFill Normal
call s:set_hi("TabLineSel", s:fg0, s:bg2, "NONE")
hi! link Visual CurSearch

hi! link StatusLineNC TabLine
hi! link StatusLine TabLineSel

call s:set_hi("VertSplit", "black", s:bg0, "NONE")

hi! link SpecialKey Comment
hi! link NonText Comment

call s:set_hi("netrwDir", s:blue2, s:bg0, "NONE")
