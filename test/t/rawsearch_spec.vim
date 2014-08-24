let s:ROOT_DIR = matchstr(system('git rev-parse --show-cdup'), '[^\n]\+')
lockvar s:ROOT_DIR
execute 'set' 'rtp +=./' . s:ROOT_DIR
runtime! plugin/rawsearch.vim


describe 'vim-rawsearch'
  it 'command-test'
    ToggleRawSearch
    ToggleRawSearch
  end

  it 'toggle-test'
    cnoremap $  asdf
    ToggleRawSearch
    ToggleRawSearch
    Expect maparg('$', 'c') ==# 'asdf'
  end
end
