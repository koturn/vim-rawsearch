" ============================================================================
" FILE: rawsearch.vim
" AUTHOR: koturn <jeak.koutan.apple@gmail.com>
" DESCRIPTION: {{{
" This plugin provides no-regex search. You can toggle normal search and
" non-regex search with this plugin.
" }}}
" ============================================================================
let s:save_cpo = &cpo
set cpo&vim


let s:SPECIAL_CHARS = ['$', '^', '*', '.', '~', '\'] | lockvar s:SPECIAL_CHARS
let s:orig_cmaps = {}
let s:is_raw_search = 0

function! rawsearch#toggle_raw_search()
  if s:is_raw_search
    call s:disable_rawsearch()
  else
    call s:enable_rawsearch()
  endif
  let s:is_raw_search = !s:is_raw_search
endfunction


function! s:enable_rawsearch()
  for l:key in s:SPECIAL_CHARS
    let s:orig_cmaps[l:key] = maparg(l:key, 'c', 0, 1)
    exec 'cnoremap <expr> ' l:key " getcmdtype() =~# '[/?]' ? '\\" . l:key . "' : '" . l:key . "'"
  endfor
endfunction


function! s:disable_rawsearch()
  for l:key in keys(s:orig_cmaps)
    let l:mapdict = s:orig_cmaps[l:key]
    if empty(l:mapdict)
      exec 'cunmap' l:key
    else
      let l:mapcmd = (l:mapdict['noremap'] ? 'cnoremap ' : 'cmap ')
            \ . (l:mapdict['buffer'] ? '<buffer> ' : '')
            \ . (l:mapdict['silent'] ? '<silent> ' : '')
            \ . (l:mapdict['expr'] ? '<expr> ' : '')
            \ . l:mapdict['lhs'] . ' ' . l:mapdict['rhs']
      exec l:mapcmd
    endif
  endfor
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
