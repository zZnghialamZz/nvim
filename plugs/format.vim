"=============================================================================
" plugs/format.vim ---- Settings for format related plugin
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

"let g:clang_format#auto_format=1
"let g:clang_format#auto_format_on_insert_leave=1      "Automatically format when exiting insert mode
let g:clang_format#style_options = {
      \ "AlignConsecutiveAssignments" : "true",
      \ "AlignConsecutiveMacros" : "true",
      \ "AllowAllArgumentsOnNextLine" : "false",
      \ "AllowAllParametersOfDeclarationOnNextLine" : "false",
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AlignEscapedNewlines" : "Right",
      \ "AlignTrailingComments" : "true",
      \ "AlwaysBreakTemplateDeclarations" : "Yes",
      \ "BreakBeforeTernaryOperators" : "true",
      \ "BreakConstructorInitializers" : "BeforeComma",
      \ "DerivePointerAlignment" : "false",
      \ "PointerAlignment" : "Left",
      \ "UseTab" : "Never",
      \ "Standard" : "C++11"}

