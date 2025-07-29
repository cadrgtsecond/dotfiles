define-command pipe-to-k %{
    prompt "K:" %{
        evaluate-commands -save-regs "a" %{
            set-register a %sh{
k <<END
s:"$(printf '%s' "$kak_selection" | sed 's/"/\\"/g')"
n: #s
\` 0: $kak_text
END
            }
            execute-keys '"aR'
        }
    }
}
