hook global WinSetOption filetype=(markdown) %{
    require-module markdown-custom
    addhl window/ wrap

    map window normal "<ret>" ": try markdown-open-link<ret>"
}

provide-module markdown-custom %{
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
