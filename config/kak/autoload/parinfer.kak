declare-option str parinfer_mode "indent"

define-command -docstring "parinfer-enable-window: enable Parinfer for current window" \
parinfer-enable-window %{
    hook -group parinfer window BufWritePre .* parinfer
}

define-command -docstring "parinfer-toggle-mode: toggle mode" \
parinfer-toggle-mode %{
    set-option window parinfer_mode %sh{
        [ "$kak_opt_parinfer_mode" = 'indent' ] && printf 'paren' || printf 'indent'
    }
}

define-command -docstring "parinfer: reformat buffer with parinfer-rust." \
parinfer %{
    evaluate-commands -save-regs '/"|^@wsa' -no-hooks %{
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
            execute-keys %sh{
                if [ -n "$kak_reg_a" ]
                then
                    printf '"aR'
                fi
            }
        }
        select %reg{s}
    }
}
