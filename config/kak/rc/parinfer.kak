declare-option int parinfer_prev_timestamp %val{timestamp}

hook -group parinfer window NormalKey .* %{
    evaluate-commands %sh{
        [ "$kak_timestamp" -ne "$kak_opt_parinfer_prev_timestamp" ] && printf parinfer
    }
    set-option window parinfer_prev_timestamp %val{timestamp}
}

define-command -override -docstring "parinfer: reformat buffer with parinfer-rust." \
parinfer %{
    evaluate-commands -save-regs '|a' -no-hooks %{
        set-register a %val{selections_desc}
        set-register | %{execlineb -c 'withstdinas -NE a backtick -NE -D $a o { heredoc 0 $a parinfer-rust } printf %s $o'}
        execute-keys "%%|<ret>"
        select %reg{a}
    }
}
