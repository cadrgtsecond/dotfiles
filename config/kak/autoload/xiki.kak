# Xiki
define-command \
xiki -override %{
    evaluate-commands -save-regs wca^| -draft %{
        set-register w ''
        try %{
            execute-keys -draft 's\A +<ret>"wy'
        } catch %{
        }
        try %{
            execute-keys -draft 'h/(?S)(\n<c-r>w  .*)*$<ret>_xd'
        } catch %{
            evaluate-commands -draft %sh{
                w="$kak_reg_w"
                printf 'execute-keys %%@x_"cy@\n'
                printf 'set-register a %%reg{c}\n'
                while test -n "$w"; do
                    w="${w#'  '}"
                    printf 'execute-keys %%@<a-/>^%s(?=[^ ])<ret>@\n' "$w"
                    printf 'execute-keys %%@x_"cy@\n'
                    printf 'set-register a %%reg{c} %%reg{a}\n'
                done
            }
            set-register c %sh{
                eval set -- "$kak_quoted_reg_a"
                xiki "$@" | sed "s/^/  $kak_reg_w/"
                printf '\n'
            }
            execute-keys -draft '"cp'
        }
    }
}
map global normal <ret> 'x: xiki<ret>'
