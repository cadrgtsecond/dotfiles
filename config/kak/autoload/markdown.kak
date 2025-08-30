hook global WinSetOption filetype=(markdown) %{
    require-module markdown-custom
    add-highlighter window/ wrap

    map window normal "<ret>" ": try markdown-open-link<ret>"
    remove-hooks window markdown-insert
    hook window InsertChar \n -group markdown-insert markdown-my-insert-on-new-line
}


provide-module markdown-custom %{
    # I don't like having `-`s automatically inserted for lists, since
    # I often use multi line list elements like an outliner
    define-command -hidden markdown-my-insert-on-new-line %{
        try %{ execute-keys -draft -itersel k x s ^\h*\K((>\h*)+)\h* <ret> y gh j P }
    }

    define-command markdown-open-link %{
        execute-keys "<a-t>[t]"
        execute-keys -save-regs 'a:' -with-hooks  %sh{
            if [ "$kak_selection" = " " ]
            then
                printf "rX"
            elif [ "$kak_selection" = "X" ]
            then
                printf "r "
            else
                file=$(rg -l "^# $kak_selection$" < /dev/null)
                if [ -z "$file" ]
                then
                    slug=$(printf '%s' "$kak_selection" | tr '[:upper:]' '[:lower:]' | tr '[:space:]' '-' )
                    printf '"ay: edit %s<ret>' "$HOME/Documents/notes/home/$slug.md"
                    printf 'i# <c-r>a<esc>'
                # TODO: Support resolving ambiguous links
                elif [ "$(printf '%s' "$file" | wc -l)" -gt 1 ]
                then
                    printf ": fail 'Ambiguous link'<ret>" > $kak_command_fifo
                else
                    printf ': edit %s<ret>' "$file"
                fi
            fi
        }
    }
}
