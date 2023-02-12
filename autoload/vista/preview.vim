" Copyright (c) 2019 Liu-Cheng Xu
" MIT License
" vim: ts=2 sw=2 sts=2 et

" Return the lines to preview and the target line number in the preview buffer.
function! vista#preview#GetLines(lnum) abort
  " Show lines around the tag source line [lnum-before, lnum+after]
  let before = g:vista_preview_before_current_lines
  let after  = g:vista_preview_after_current_lines

  if a:lnum - before > 0
    let preview_lnum = before + 1
  else
    let preview_lnum = a:lnum
  endif

  let begin = max([a:lnum - before, 1])
  let end = begin + before + after

  return [getbufline(g:vista.source.bufnr, begin, end), preview_lnum]
endfunction
