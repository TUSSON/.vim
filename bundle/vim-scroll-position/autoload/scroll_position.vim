if exists("g:loaded_scroll_position") || !has('signs')
  finish
endif
let g:loaded_scroll_position = 1

let s:enabled = 0

function scroll_position#show()
  let s:types = {}

  if exists("g:scroll_position_jump")
    exec "sign define scroll_position_j text=".g:scroll_position_jump." texthl=ScrollPositionJump"
    let s:types['j'] = "''"
  endif
  if exists("g:scroll_position_change")
    exec "sign define scroll_position_c text=".g:scroll_position_change." texthl=ScrollPositionchange"
    let s:types['c'] = "'."
  endif

  let s:marker         = get(g:, 'scroll_position_marker', '>')

  let s:types['m'] = "w0"
  exec "sign define scroll_position_m text=".s:marker." texthl=ScrollPositionMarker"

  sign define scroll_position_e

  if !exists("g:scroll_position_exclusion")
    let s:exclusion = "&buftype == 'nofile'"
  endif

  augroup ScrollPosition
    autocmd!
    autocmd BufNewFile,BufRead * call s:fix_sign()
    autocmd WinEnter,CursorMoved,CursorMovedI,VimResized * :call s:update()
  augroup END

  let s:enabled = 1
  let s:put_fmt = "sign place 99999%d line=%d name=scroll_position_%s buffer=%d"
  let s:rem_fmt = "sign unplace 99999%d buffer=%d"
  call s:fix_sign()
  call s:update()
endfunction

function! s:num_sort(a, b)
  return a:a>a:b ? 1 : a:a==a:b ? 0 : -1
endfunction

function! s:fix_sign()
  exec printf("sign place 8888880 line=1 name=scroll_position_e buffer=%d", bufnr('%'))
endfunction

function! s:put_sign(type, pos)
  exec printf(s:put_fmt, a:pos, a:pos, a:type, bufnr('%'))
endfunction

function! s:rem_sign(pos)
  exec printf(s:rem_fmt, a:pos, bufnr('%'))
endfunction

function s:update()
  if eval(s:exclusion)
    return
  endif

  if !exists('b:scroll_position_pplaces')
    let b:scroll_position_pplaces = {}
    let b:scroll_position_pline   = 0
    let b:scroll_position_plines  = 0
  endif

  let top    = line('w0')
  let height = line('w$') - top + 1

  let lines         = line('$') - height + 1
  let cline         = line('w0')
  let line_changed  = cline  != b:scroll_position_pline
  let lines_changed = lines  != b:scroll_position_plines
  if !lines_changed && !line_changed
    return
  endif
  let b:scroll_position_pline   = cline

  let types = s:types

  let places  = {}
  let vrange  = []
  let pplaces = b:scroll_position_pplaces
  for [type, l] in items(types)
    let line = line(l)
    if line
      let lineno = top + float2nr(height * (line - 1) / lines)
      if type == 'vb' || type == 've'
        call add(vrange, lineno)
      else
        let places[lineno] = type
      endif
    endif
  endfor

  " Remove all previous signs when total number of lines changed
  let pkeys = keys(pplaces)
  let clearing = lines_changed

  for pos in pkeys
      call s:rem_sign(pos)
  endfor

  " Place signs when required
  " - Total number of lines changed (cleared)
  " - New position
  " - Type changed
  for [pos, type] in items(places)
    if clearing || !has_key(pplaces, pos) || type != pplaces[pos]
      call s:put_sign(type, pos)
    endif
  endfor

  let b:scroll_position_plines  = lines
  let b:scroll_position_pplaces = places
endfunction

function scroll_position#hide()
  augroup ScrollPosition
    autocmd!
  augroup END
 " FIXME
  sign unplace *
  unlet b:scroll_position_pplaces
  unlet b:scroll_position_pline
  unlet b:scroll_position_plines
  let s:enabled = 0
endfunction

function scroll_position#update()
  if s:enabled
    call s:update()
  endif
endfunction

function scroll_position#toggle()
  if s:enabled
    call scroll_position#hide()
  else
    call scroll_position#show()
  endif
endfunction
