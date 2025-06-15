define-command -docstring "parinfer-enable-window [<mode>]: enable Parinfer for current window" \
parinfer-enable-window -params ..1 %{
    require-module parinfer
    hook -group parinfer window NormalKey .* %{ parinfer }
    hook -group parinfer window ModeChange pop:insert:.* %{ parinfer }
}

define-command -docstring "parinfer-disable-window: disable Parinfer for current window." \
parinfer-disable-window %{
    remove-hooks window parinfer
}

provide-module parinfer %{
declare-option -hidden -docstring "Current selection" \
str-list parinfer_selection_desc

define-command -override -docstring "parinfer: reformat buffer with parinfer-rust." \
parinfer %{
    evaluate-commands -draft -save-regs '/"|^@' -no-hooks %{
        set-option window parinfer_selection_desc %val{selections_desc}
        execute-keys '%|parinfer-rust<ret>'
    }
    select %opt{parinfer_selection_desc}
}
}
