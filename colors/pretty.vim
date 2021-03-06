"  --
"  Something pretty for Vim, with a focus on Lua and C.
"  Colin 'Oka' Hall-Coates, MIT 2021 <yo@oka.io>
"  --

hi clear

set background=dark

if exists('syntax_on')
	syntax reset
endif

let g:colors_name = 'pretty'

let s:GREY = '#abb2bf'
let s:DARK_GREY = '#989da7'
let s:DARKER_GREY = '#5c6370'

let s:SHADOW = '#262626'
let s:BRIGHT = '#eeeeee'

let s:BLUISH = '#66abe3'
let s:GREENISH = '#91b577'
let s:ORANGISH = '#e3a05d'
let s:PINK = '#ed68a1'

let s:GRAVEL = '#877a7a'

fun! s:elect (n, ls)
	return len(a:ls) >= a:n && strlen(a:ls[a:n - 1]) ? a:ls[a:n - 1] : "NONE"
endfun

fun! s:higui (group, fg, ...)
	let bg = s:elect(1, a:000)
	let style = s:elect(2, a:000)

	exe 'hi '.a:group.' guifg='.a:fg.' guibg='.bg.' gui='.style
endfun

fun! s:clear (group)
	exe 'hi clear '.a:group
endfun

" UI
call s:higui('Pmenu', s:GRAVEL, s:SHADOW)
call s:higui('PmenuSel', s:PINK, s:SHADOW)
call s:higui('PmenuSbar', s:BRIGHT, s:SHADOW)
call s:higui('PmenuThumb', s:SHADOW, s:BRIGHT)

" General settings
call s:higui('LineNr', s:DARK_GREY)
call s:higui('CursorLineNr', s:GREY)

call s:higui('StatusLine', s:SHADOW, s:GREY)
call s:higui('ErrorMsg', s:ORANGISH)

call s:higui('Directory', s:BLUISH)
call s:higui('NonText', s:GREY)

call s:higui('SpecialKey', s:GREY)
call s:clear('SignColumn')

call s:higui('Title', s:GREY)

call s:higui('Todo', s:GREENISH)

call s:higui('Normal', s:GREY)
call s:higui('PreProc', s:GREY)
call s:higui('StorageClass', s:GREENISH)

call s:higui('Operator', s:DARK_GREY)
call s:higui('Comment', s:DARKER_GREY, '', 'italic')

call s:higui('Type', s:BLUISH)
call s:higui('Statement', s:PINK)
call s:higui('Function', s:BLUISH)
call s:higui('Identifier', s:GREENISH)

call s:higui('Constant', s:ORANGISH)
call s:higui('Special', s:ORANGISH)

call s:higui('String', s:GRAVEL)

" C specific
call s:higui('cDefine', s:GREENISH)
call s:higui('cOperator', s:GREENISH)
call s:higui('cPreCondit', s:GREENISH)

" Lua specific
call s:higui('luaLocal', s:PINK)
call s:higui('luaBraces', s:BLUISH)
call s:higui('luaFunction', s:PINK)
call s:higui('luaFuncKeyword', s:PINK)
call s:higui('luaFuncCall', s:BLUISH)
call s:higui('luaSpecialValue', s:GREENISH)

" Python specific
call s:higui('pythonInclude', s:PINK)
call s:higui('pythonOperator', s:PINK)
