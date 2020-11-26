" Setup{{{
set background=dark
hi clear

if exists('syntax_on')
  syntax reset
endif
function! s:h(name, attr)
        let s = ''

        let fg = get(a:attr, 'fg', '')
        let bg = get(a:attr, 'bg', '')
        let format = get(a:attr, 'format', '')


        if fg == 'NONE' || fg == 'none'
                let s .= ' ctermfg=NONE guifg=NONE'
        elseif strpart(fg, 0, 1) == '#'
                let s .= ' guifg='.fg
        elseif fg != '' && has_key(s:p, fg)
                let s .= ' guifg=' . get(s:p, fg)
        " elseif fg != '' && (str2nr(fg) >= 0 || str2nr(fg) < 256)
                " let s .= ' ctermfg='.fg
        endif

        if bg == 'NONE' || bg == 'none'
                let s .= ' ctermbg=NONE guibg=NONE'
        elseif strpart(bg, 0, 1) == '#'
                let s .= ' guibg='.bg
        elseif bg != '' && has_key(s:p, bg)
                let s .= ' guibg=' . get(s:p, bg)
        " elseif bg != '' && (str2nr(bg) >= 0 || str2nr(bg) < 256)
                " let s .= ' ctermbg='.bg
        endif

        if format != '' && (match(format, 'bold') != -1 || match(format, 'italic') != -1 || match(format, 'underline') != -1) || (format == 'NONE' || format == 'none')
                let s .= ' cterm=' . format
        endif

        if (s != '')
                execute 'hi '.a:name.' '.s
        endif
        " possible values for format:
        " bold
        " underline
        " undercurl	        not always available
        " strikethrough	        not always available
        " reverse
        " inverse		same as reverse
        " italic
        " standout
        " nocombine	override attributes instead of combining them
        " NONE		no attributes used (used to reset it)
endfunction"}}}
" Color Palette{{{
" -------------
let s:p = {}

let s:p.white0          = '#ffffff'
let s:p.white1          = '#eeeeee'
let s:p.white2          = '#dddddd'
let s:p.white3          = '#cccccc'
let s:p.white4          = '#bbbbbb'
let s:p.white5          = '#aaaaaa'
let s:p.white6          = '#999999'
let s:p.white7          = '#888888'
let s:p.black7          = '#777777'
let s:p.black6          = '#666666'
let s:p.black5          = '#555555'
let s:p.black4          = '#444444'
let s:p.black3          = '#333333'
let s:p.black2          = '#222222'
let s:p.black1          = '#111111'
let s:p.black0          = '#000000'

" let s:p.fg              = '#e8e8e3'
" let s:p.bg              = '#272822'

let s:p.fg              = '#e8e8e3'
let s:p.bg              = '#272822'

let s:p.darkred         = '#550000'
let s:p.darkblue        = '#000055'

let s:p.lightbrown      = '#75715e'
let s:p.brown           = '#553322'
let s:p.red             = '#e73c50'
let s:p.orange          = '#fd9720'
let s:p.cheese          = '#ffdd44'
let s:p.sunny           = '#ffee00'
let s:p.yellow          = '#e6db74'
let s:p.chartreuse      = '#ccff00'
let s:p.green           = '#a6e22d'
let s:p.jade            = '#33ff99'
let s:p.deepsea         = '#111133'
let s:p.navy            = '#224488'
let s:p.aqua            = '#228080'
let s:p.cyan            = '#66d9ef'
let s:p.blue            = '#33aaff'
let s:p.lightpurple     = '#80a0ff'
let s:p.purple          = '#ae81ff'
let s:p.salmon          = '#ff7766'
let s:p.pink            = '#f92772'

" let s:p.primary         = 'red'
" let s:p.secondary       = 'secondary'
" let s:p.tertiary        = 'tertiary'

" let s:p.type            = 'cyan'
" let s:p.constant        = 'purple'

" let defs = {
"       \ 'type': s:h({ 'fg': 'cyan', 'format': 'italic' }),
"       \ 'constant': s:h({ 'fg': 'purple' }),
"       \ 'string': s:h({ 'fg': 'yellow' }),
" \ }

" Extras

" let s:p.tablinesel      = 'black2'

let s:p.none            = 'NONE' " TODO Comment
let s:p.NONE            = 'NONE'

let s:p.bold            = 'bold'
let s:p.italic          = 'italic'
let s:p.underline       = 'underline'
"}}}
" Syntax Highlighting {{{
" ------------
" this vim command flips the fg with bg positioning. not perfect.
" s/'bg':\s\+'\([#a-zA-Z0-9]\+\)',\s\+'fg':\s\+'\([#a-zA-Z0-9]\+\)\'/'fg': '\2', 'bg': '\1'/g
"
" Editor{{{
" ------------
" Editor Window Colors{{{
call s:h('Normal', { 'fg': 'fg', 'bg': 'bg' })
call s:h('Visual', { 'bg': 'black5' })
call s:h('ColorColumn', { 'bg': 'black3' })
call s:h('LineNr', { 'fg': 'white7', 'bg': 'black3' })
call s:h('SignColumn', { 'bg': 'black3' })
"}}}
" Cursor{{{
call s:h('Cursor', { 'fg': 'fg', 'bg': 'bg', 'format': 'underline' })
call s:h('CursorColumn', { 'bg': 'black3' })
call s:h('CursorLine', { 'bg': 'black3', 'format': 'NONE' })
call s:h('CursorLineNr', { 'fg': 'orange', 'bg': 'black3', 'format': 'NONE' })
"}}}
" Search{{{
" call s:h('Search', { 'fg': 'NONE', 'bg': 'aqua' })
call s:h('Search', { 'fg': 'NONE', 'bg': '#0033cc', 'format': 'NONE' })
"}}}
" Messages{{{
call s:h('Question', { 'fg': 'yellow' })
call s:h('ModeMsg', { 'fg': 'yellow' })
call s:h('VertSplit', { 'fg': 'fg', 'bg': 'bg', 'format': 'bold' })
call s:h('MoreMsg', { 'fg': 'yellow' })
call s:h('ErrorMsg', { 'fg': 'bg', 'bg': 'red', 'format': 'standout' })
call s:h('WarningMsg', { 'fg': 'red' })
"}}}
" Tab Line{{{
call s:h('TabLine', { 'fg': 'black6', 'bg': 'black1', 'format': 'NONE' })
call s:h('TabLineSel', { 'fg': 'white2', 'bg': 'black1', 'format': 'underline' })
call s:h('TabLineFill', { 'fg': 'fg', 'bg': 'black1', 'format': 'NONE' })
"}}}
" Status Line{{{
call s:h('StatusLine', { 'fg': 'white0', 'bg': 'black1', 'format': 'none' })
call s:h('StatusLineNC', { 'fg': 'black5', 'bg': 'black1', 'format': 'NONE' })
"}}}
" User1...9 (For Tab Line and Status Line) {{{
call s:h('User1', { 'fg': 'red',	'bg': 'black1', 'format': 'NONE' })
call s:h('User2', { 'fg': 'orange',	'bg': 'black1', 'format': 'NONE' })
call s:h('User3', { 'fg': 'yellow',	'bg': 'black1', 'format': 'NONE' })
call s:h('User4', { 'fg': 'green',	'bg': 'black1', 'format': 'NONE' })
call s:h('User5', { 'fg': 'cyan',	'bg': 'black1', 'format': 'NONE' })
call s:h('User6', { 'fg': 'blue',	'bg': 'black1', 'format': 'NONE' })
call s:h('User7', { 'fg': 'purple',	'bg': 'black1', 'format': 'NONE' })
call s:h('User8', { 'fg': 'white0',	'bg': 'black1', 'format': 'NONE' })
call s:h('User9', { 'fg': 'black0',	'bg': 'black1', 'format': 'NONE' })
"}}}
" Spell{{{
call s:h('SpellBad', { 'fg': 'red', 'format': 'underline' })
call s:h('SpellCap', { 'fg': 'purple', 'format': 'underline' })
call s:h('SpellRare', { 'fg': 'cyan', 'format': 'underline' })
call s:h('SpellLocal', { 'fg': 'pink', 'format': 'underline' })
"}}}
" Misc{{{
" {}()[]
call s:h('MatchParen', { 'fg': 'red', 'bg': 'cyan', 'format': 'bold' })
call s:h('SpecialKey', { 'fg': 'pink' })
call s:h('NonText', { 'fg': 'cyan' })
call s:h('Title', { 'fg': 'yellow' })
call s:h('Directory', { 'fg': 'cyan' })
"}}}
" Diff{{{
call s:h('DiffAdd', { 'fg': 'bg', 'bg': 'green' })
call s:h('DiffDelete', { 'fg': 'bg', 'bg': 'red' })
call s:h('DiffChange', { 'fg': 'bg', 'bg': 'yellow' })
call s:h('DiffText', { 'fg': 'bg', 'bg': 'cyan' })
"}}}
" Folds{{{
call s:h('Folded', { 'fg': 'white6', 'bg': 'black3' })
call s:h('FoldColumn', { 'bg': 'black3' })
"}}}
" Menu{{{

call s:h('Pmenu', { 'fg': 'white0', 'bg': 'black0' })
call s:h('PmenuSel', { 'fg': 'white0', 'bg': 'NONE', 'format': 'underline' })
call s:h('PmenuThumb', { 'fg': 'black0', 'bg': 'black3' })
call s:h('PmenuSbar', { 'fg': 'black0', 'bg': 'black5' })

"}}}
" Column0...9 For what??{{{
call s:h('column0', {'fg': 'red'})
call s:h('column1', {'fg': 'orange'})
call s:h('column2', {'fg': 'yellow'})
call s:h('column3', {'fg': 'green'})
call s:h('column4', {'fg': 'blue'})
call s:h('column5', {'fg': 'cyan'})
call s:h('column6', {'fg': 'purple'})
call s:h('column7', {'fg': 'pink'})
call s:h('column8', {'fg': 'green'})
call s:h('column9', {'fg': 'blue'})
"}}}
"}}}
" Generic Syntax Highlighting{{{
" ---------------------------
" Constant: ie Number, Float, Boolean{{{
call s:h('Constant', { 'fg': 'purple' })
call s:h('Number', { 'fg': 'purple' })
call s:h('Float', { 'fg': 'purple' })
call s:h('Boolean', { 'fg': 'purple' })
call s:h('Character', { 'fg': 'yellow' })
call s:h('String', { 'fg': 'yellow' })
"}}}
" Type{{{
call s:h('Type', { 'fg': 'cyan', 'format': 'italic'})
call s:h('Structure', { 'fg': 'cyan' })
call s:h('StorageClass', { 'fg': 'cyan' })
call s:h('Typedef', { 'fg': 'cyan' })
"}}}
" Identifier{{{
call s:h('Identifier', { 'fg': 'green' })
call s:h('Function', { 'fg': 'green', 'format': 'bold'})
"}}}
" Statement{{{
call s:h('Statement', { 'fg': 'pink' })
call s:h('Operator', { 'fg': 'pink' })
"}}}
" Label{{{
call s:h('Label', { 'fg': 'salmon' })
call s:h('Statement', { 'fg': 'pink', 'format': 'bold' })
call s:h('PreProc', { 'fg': 'orange', 'format': 'italic' })
"}}}
" Include{{{
call s:h('Include', { 'fg': 'pink' })
call s:h('Define', { 'fg': 'pink' })
call s:h('Macro', { 'fg': 'green' })
call s:h('PreCondit', { 'fg': 'green' })
"}}}
" Special{{{
call s:h('Special', { 'fg': 'purple' })
call s:h('SpecialChar', { 'fg': 'pink' })
call s:h('Delimiter', { 'fg': 'pink' })
call s:h('SpecialComment',{ 'fg': 'cyan' })
call s:h('Tag', { 'fg': 'pink' })
"}}}
" Debug{{{
call s:h('Todo', { 'fg': 'purple', 'bg': 'none' })
call s:h('Comment', { 'fg': 'lightbrown', 'format': 'italic' })
call s:h('Underlined', { 'fg': 'green' })
call s:h('Ignore', {})
call s:h('Error', { 'fg': 'red', 'bg': 'darkred' })
"}}}
"}}}
" Languages{{{
" ---------------------------
" Vim{{{
call s:h('vimCommand', { 'fg': 'pink' })
call s:h('vimFuncKey', { 'fg': 'pink', 'format': 'NONE' })
call s:h('vimFuncKey', {'fg': 'cyan', 'format': 'italic'})
"}}}
" Javascript{{{
call s:h('jsFuncCall', { 'fg': 'blue', 'format': 'bold'})
call s:h('jsFuncName', { 'fg': 'green' })
call s:h('jsThis', { 'fg': 'cyan', 'format': 'italic'})
call s:h('jsFunctionKey', { 'fg': 'green', 'format': 'bold'})
call s:h('jsPrototype', { 'fg': 'cyan' })
call s:h('jsExceptions', { 'fg': 'cyan' })
call s:h('jsFutureKeys', { 'fg': 'cyan' })
call s:h('jsBuiltins', { 'fg': 'cyan' })
call s:h('jsArgsObj', { 'fg': 'cyan' })
call s:h('jsStatic', { 'fg': 'cyan' })
call s:h('jsSuper', { 'fg': 'cyan' })
call s:h('jsObjectKey', { 'fg': 'salmon', 'format': '' })
call s:h('jsGlobalObjects', { 'fg': 'cyan', 'format': 'italic'})
call s:h('jsFuncArgRest', { 'fg': 'purple', 'format': 'italic' }) 
call s:h('jsFuncArgs', { 'fg': 'orange', 'format': 'italic' })
call s:h('jsStorageClass', { 'fg': 'cyan', 'format': 'italic' })
call s:h('jsDocTags', { 'fg': 'cyan', 'format': 'italic' })
 "}}}
" HTML{{{
call s:h('htmlTag', { 'fg': 'fg' })
call s:h('htmlEndTag', { 'fg': 'fg' })
call s:h('htmlTagName', { 'fg': 'pink' })
call s:h('htmlArg', { 'fg': 'green' })
call s:h('htmlSpecialChar', { 'fg': 'purple' })
" syn region vueVfyTag start=++ end=+<\v+
" hi def link htmlTag vueVfyTag
" call s:h('vueVfyTag', {'fg': 'blue', 'format': 'bold'})
"}}}
" XML{{{
call s:h('xmlTag', { 'fg': 'pink' })
call s:h('xmlEndTag', { 'fg': 'pink' })
call s:h('xmlTagName', { 'fg': 'orange' })
call s:h('xmlAttrib', { 'fg': 'green' })
"}}}
" CSS{{{
call s:h('cssProp', { 'fg': 'yellow' })
call s:h('cssUIAttr', { 'fg': 'yellow' })
call s:h('cssFunctionName', { 'fg': 'cyan' })
call s:h('cssColor', { 'fg': 'purple' })
call s:h('cssPseudoClassId', { 'fg': 'purple' })
call s:h('cssClassName', { 'fg': 'green' })
call s:h('cssValueLength', { 'fg': 'purple' })
call s:h('cssCommonAttr', { 'fg': 'pink' })
call s:h('cssBraces' , { 'fg': 'fg' })
call s:h('cssClassNameDot', { 'fg': 'pink' })
call s:h('cssURL', { 'fg': 'orange', 'format': 'underline,italic' })
"}}}
" C{{{
call s:h('cLabel', { 'fg': 'pink' })
call s:h('cStructure', { 'fg': 'pink' })
call s:h('cStorageClass', { 'fg': 'pink' })
call s:h('cInclude', { 'fg': 'green' })
call s:h('cDefine', { 'fg': 'green' })
"}}}
" HELP{{{
call s:h('helpExample', {'fg': 'lightpurple', 'bg': 'bg', 'format': 'none'})
call s:h('helpCommand', {'fg': 'pink', 'bg': 'bg', 'format': 'none'})
"}}}
" GraphQL{{{
call s:h('graphqlStructure', { 'fg': 'pink', 'format': 'bold'})
call s:h('graphqlType', { 'fg': 'blue', 'format': 'italic'})
call s:h('graphqlName', { 'fg': 'orange', 'format': ''})
call s:h('graphqlBraces', { 'fg': 'green', 'format': 'bold'})
"}}}
" Markdown{{{
call s:h('mkdCode', {'fg': 'red', 'format': 'bold' })
call s:h('htmlItalic', {'fg': 'cyan', 'format': 'italic' })
call s:h('htmlBold', {'fg': 'green', 'format': 'bold' })
"}}}
"}}}
"}}}
