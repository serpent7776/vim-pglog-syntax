" Vim syntax file
" Language: PostgreSQL log files
" Maintainer: Serpent7776
" Last Change: 2024.11
" URL: https://github.com/serpent7776/vim-pglog-syntax
" License: 2-clause BSD license

if exists("b:current_syntax")
  finish
endif

" Basic log elements
syn match pgTimestamp /^\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}:\d\{2}\.\d\{3} \a\{3,4}/ nextgroup=pgUser skipwhite
syn match pgUser /\v[^[]]+/ contained nextgroup=pgProcessId
syn match pgProcessId /\v\[\d+\]/ contained nextgroup=pgSessionId
syn match pgSessionId /\v\[\w+\.\d+\]/ contained nextgroup=pgLineNumber
syn match pgLineNumber /\v\[\d+\]/ contained nextgroup=pgLogLevel
syn match pgLogLevel /\v< ERROR |FATAL |PANIC |WARNING |NOTICE |INFO |DEBUG |LOG >/ contained

" Error and warning messages
syn match pgError /\v(ERROR|FATAL|PANIC):.*$/
syn match pgWarning /\v(WARNING|NOTICE):.*$/
syn match pgInfo /\v(INFO|LOG):.*$/

" Additional log components with their content
syn match pgContext /\vCONTEXT:.*$/·
syn match pgStatement /\vSTATEMENT:.*$/
syn match pgDetail /\vDETAIL:.*$/
syn match pgHint /\vHINT:.*$/

" Database objects
syn match pgDatabase /\v database \zs\w+\ze/
syn match pgTable /\v table \zs\w+\ze/
syn match pgColumn /\v column \zs\w+\ze/

" SQL statements
syn region pgSQL start=/\v(EXECUTE|SELECT|INSERT|UPDATE|DELETE)/ end=/;/ contains=pgString
syn region pgString start=/'/ end=/'/ skip=/\\'/ contained

" Duration
syn match pgDuration /\v\d+(\.\d+)?(ms|s|min)/

" Define colors
hi def link pgTimestamp Identifier
hi def link pgUser Special
hi def link pgProcessId Number
hi def link pgSessionId Type
hi def link pgLineNumber LineNr
hi def link pgLogLevel Statement
hi def link pgError ErrorMsg
hi def link pgWarning WarningMsg
hi def link pgInfo Comment

hi def link pgContext MoreMsg
hi def link pgStatement MoreMsg
hi def link pgDetail MoreMsg
hi def link pgHint MoreMsg

hi def link pgDatabase Constant
hi def link pgTable Identifier
hi def link pgColumn Special
hi def link pgSQL Statement
hi def link pgString String
hi def link pgDuration Number

let b:current_syntax = "pglog"
