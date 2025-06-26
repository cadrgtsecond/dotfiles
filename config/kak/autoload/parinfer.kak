define-command -docstring "parinfer-enable-window [<mode>]: enable Parinfer for current window" \
parinfer-enable-window -params ..1 %{
    hook -group parinfer window NormalKey .* %{ parinfer }
    hook -group parinfer window ModeChange pop:insert:.* %{ parinfer }
}

define-command -docstring "parinfer-disable-window: disable Parinfer for current window." \
parinfer-disable-window %{
    remove-hooks window parinfer
}

define-command -override -docstring "parinfer: reformat buffer with parinfer-rust." \
parinfer %{
    evaluate-commands -save-regs '/"|^@s' -no-hooks %{
        reg s %val{selections_desc}
        try %{ execute-keys -draft '%|parinfer-rust<ret>' }
        select %reg{s}
    }
}
