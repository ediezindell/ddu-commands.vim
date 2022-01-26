" set verbose=1

let s:suite = themis#suite('parse')
let s:assert = themis#helper('assert')

function! s:suite.parse_options_args() abort
  call s:assert.equals(ddu#commands#_parse_options_args(
        \ 'foo bar'),
        \ {
        \   'sources': [
        \     {'name': 'foo', 'options': {}, 'params': {}},
        \     {'name': 'bar', 'options': {}, 'params': {}},
        \   ],
        \   'uiOptions': { '_': {} },
        \   'uiParams': { '_': {} },
        \   'sourceOptions': { '_': {} },
        \   'sourceParams': { '_': {} },
        \ })
  call s:assert.equals(ddu#commands#_parse_options_args(
        \ 'foo -input=bar'),
        \ {
        \   'sources': [
        \     {'name': 'foo', 'options': {}, 'params': {}},
        \   ],
        \   'input': 'bar',
        \   'uiOptions': { '_': {} },
        \   'uiParams': { '_': {} },
        \   'sourceOptions': { '_': {} },
        \   'sourceParams': { '_': {} },
        \ })
  call s:assert.equals(ddu#commands#_parse_options_args(
        \ '-source-option-path=bar foo'),
        \ {
        \   'sources': [
        \     {'name': 'foo', 'options': {}, 'params': {}},
        \   ],
        \   'uiOptions': { '_': {} },
        \   'uiParams': { '_': {} },
        \   'sourceOptions': {
        \     '_': {
        \       'path': 'bar',
        \     },
        \   },
        \   'sourceParams': { '_': {} },
        \ })
  call s:assert.equals(ddu#commands#_parse_options_args(
        \ 'foo -source-option-path=bar'),
        \ {
        \   'sources': [
        \     {'name': 'foo', 'options': { 'path': 'bar' }, 'params': {}},
        \   ],
        \   'uiOptions': { '_': {} },
        \   'uiParams': { '_': {} },
        \   'sourceOptions': { '_': {} },
        \   'sourceParams': { '_': {} },
        \ })
  call s:assert.equals(ddu#commands#_parse_options_args(
        \ '-source-param-path=bar foo'),
        \ {
        \   'sources': [
        \     {'name': 'foo', 'options': {}, 'params': {}},
        \   ],
        \   'uiOptions': { '_': {} },
        \   'uiParams': { '_': {} },
        \   'sourceOptions': { '_': {} },
        \   'sourceParams': {
        \     '_': {
        \       'path': 'bar',
        \     },
        \   },
        \ })
  call s:assert.equals(ddu#commands#_parse_options_args(
        \ 'foo -source-param-path=bar'),
        \ {
        \   'sources': [
        \     {'name': 'foo', 'options': {}, 'params': { 'path': 'bar' }},
        \   ],
        \   'uiOptions': { '_': {} },
        \   'uiParams': { '_': {} },
        \   'sourceOptions': { '_': {} },
        \   'sourceParams': { '_': {} },
        \ })
  call s:assert.equals(ddu#commands#_parse_options_args(
        \ 'foo -ui-option-foo=bar'),
        \ {
        \   'sources': [
        \     {'name': 'foo', 'options': {}, 'params': {}},
        \   ],
        \   'uiOptions': { '_': { 'foo': 'bar' } },
        \   'uiParams': { '_': {} },
        \   'sourceOptions': { '_': {} },
        \   'sourceParams': { '_': {} },
        \ })
  call s:assert.equals(ddu#commands#_parse_options_args(
        \ 'foo -ui-param-foo=bar'),
        \ {
        \   'sources': [
        \     {'name': 'foo', 'options': {}, 'params': {}},
        \   ],
        \   'uiOptions': { '_': {} },
        \   'uiParams': { '_': { 'foo': 'bar' } },
        \   'sourceOptions': { '_': {} },
        \   'sourceParams': { '_': {} },
        \ })

  " If omit value, v:true is used
  call s:assert.equals(ddu#commands#_parse_options_args(
        \ 'foo -resume'),
        \ {
        \   'sources': [
        \     {'name': 'foo', 'options': {}, 'params': {}},
        \   ],
        \   'resume': v:true,
        \   'uiOptions': { '_': {} },
        \   'uiParams': { '_': {} },
        \   'sourceOptions': { '_': {} },
        \   'sourceParams': { '_': {} },
        \ })
  call s:assert.equals(ddu#commands#_parse_options_args(
        \ 'foo -ui-param-foo'),
        \ {
        \   'sources': [
        \     {'name': 'foo', 'options': {}, 'params': {}},
        \   ],
        \   'uiOptions': { '_': {} },
        \   'uiParams': { '_': { 'foo': v:true } },
        \   'sourceOptions': { '_': {} },
        \   'sourceParams': { '_': {} },
        \ })
endfunction
