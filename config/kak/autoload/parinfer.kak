declare-option str parinfer_mode smart
declare-option int parinfer_prev_timestamp 0

define-command -docstring "parinfer-enable-window: enable Parinfer for current window" \
parinfer-enable-window %{
    hook -group parinfer window NormalKey .* %{
        evaluate-commands %sh{
            [ "$kak_timestamp" -ne "$kak_opt_parinfer_prev_timestamp" ] && printf parinfer
        }
        set-option window parinfer_prev_timestamp %val{timestamp}
    }
}

define-command -docstring "parinfer-toggle-mode: toggle mode" \
parinfer-toggle-mode %{
    set-option window parinfer_mode %sh{
        [ "$kak_opt_parinfer_mode" = 'indent' ] && printf 'paren' || printf 'indent'
    }
}

declare-option str-list parinfer_previous_selection
define-command -override -docstring "parinfer: reformat buffer with parinfer-rust." \
parinfer %{
    evaluate-commands -draft -save-regs '/"|^@' -no-hooks %{
        set-option window parinfer_previous_selection %val{selections_desc}
        execute-keys '%|parinfer-rust<ret>'
    }
    select %opt{parinfer_previous_selection}
}
