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
        execute-keys -with-hooks %sh{
            if [ "$kak_selection" = " " ]
            then
                echo "rX"
            elif [ "$kak_selection" = "X" ]
            then
                echo "r "
            else
                # TODO: Move this into its own script
            	file=$(rg -l "^# $kak_selection" < /dev/null)
                if [ -z "$file" ]
                then
                    echo "fail 'Link does not exist yet'"
                # TODO: Support resolving ambiguous links
                elif [ $(echo "$file" | wc -l) -ne 1 ]
                then
                    echo "fail 'Ambiguous link'" > $kak_command_fifo
                    exit 1
                fi
                echo ":e '$file'<ret>"
            fi
        }
    }
}
