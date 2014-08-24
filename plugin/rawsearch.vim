" ============================================================================
" FILE: rawsearch.vim
" AUTHOR: koturn <jeak.koutan.apple@gmail.com>
" DESCRIPTION: {{{
" This plugin provides no-regex search. You can toggle normal search and
" non-regex search with this plugin.
" }}}
" ============================================================================
if exists('g:loaded_rawsearch')
  finish
endif
let g:loaded_rawsearch = 1
let s:save_cpo = &cpo
set cpo&vim


command! -bar ToggleRawSearch  call rawsearch#toggle_raw_search()


let &cpo = s:save_cpo
unlet s:save_cpo
