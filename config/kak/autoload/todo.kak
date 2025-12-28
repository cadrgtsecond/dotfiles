# todo.txt highlighting
hook global WinCreate .*todo\.txt %{
    set-option window filetype todotxt
}
hook global WinSetOption filetype=todotxt %{
    add-highlighter window/todotxt group
    add-highlighter window/todotxt/done regex '^x .*?$' 0:+s@comment
    add-highlighter window/todotxt/date regex '(\(.\) )?(\d{4}-\d{2}-\d{2})' 2:TodoDate
    add-highlighter window/todotxt/priority-a regex '^\(A\)' 0:TodoPrioA
    add-highlighter window/todotxt/priority-b regex '^\(B\)' 0:TodoPrioB
    add-highlighter window/todotxt/priority-c regex '^\(C\)' 0:TodoPrioC
    add-highlighter window/todotxt/priority-d regex '^\(D\)' 0:TodoPrioD
    add-highlighter window/todotxt/context regex ' @[^\s]+' 0:meta
    add-highlighter window/todotxt/project regex ' \+[^\s]+' 0:keyword

    set-face window TodoPrioA red+b
    set-face window TodoPrioB yellow+b
    set-face window TodoPrioC green+b
    set-face window TodoPrioD blue+b
    set-face window TodoDate comment
}
