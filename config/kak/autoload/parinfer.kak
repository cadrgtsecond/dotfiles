declare-option str parinfer_mode "indent"
declare-option -hidden -docstring "Timestamp of the last check" int \
    parinfer_last_checked

define-command -docstring "parinfer-enable-window: enable Parinfer for current window" \
parinfer-enable-window %{
    set-option window parinfer_last_checked %val{timestamp}
    hook -group parinfer window NormalIdle .* %{
        evaluate-commands %sh{
            [ "$kak_opt_parinfer_last_checked" -ne "$kak_timestamp" ] && printf 'parinfer'
        }
        set-option current parinfer_last_checked %val{timestamp}
    }
}

define-command -docstring "parinfer-disable-window: disable Parinfer for current window." \
parinfer-disable-window %{
    remove-hooks window parinfer
    unmap window user "p"
}

define-command -docstring "parinfer-toggle-mode: toggle mode" \
parinfer-toggle-mode %{
    set-option window parinfer_mode %sh{
        [ "$kak_opt_parinfer_mode" = 'indent' ] && printf 'paren' || printf 'indent'
    }
}
define-command -docstring "parinfer: reformat buffer with parinfer-rust." \
parinfer %{
    evaluate-commands -save-regs '/"|^@sa' -no-hooks %{
        set-register s %val{selections_desc}
        evaluate-commands -draft %{
            execute-keys '%'
            set-register a %sh{
                result=$(printf '%s' "$kak_reg_dot" | parinfer-rust -m "$kak_opt_parinfer_mode")
                if [ $? -eq 0 ]
                then
                    printf '%s' "$result"
                fi
            }
            execute-keys -draft %sh{
                if [ -n "$kak_reg_a" ]
                then
                    printf '"aR'
                fi
            }
        }
        select %reg{s}
    }
}
