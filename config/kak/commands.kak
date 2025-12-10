toggle-option window modelinefmt '%val{bufname} %val{cursor_line}:%val{cursor_char_column} {{context_info}} {{mode_info}} - %val{client}@[%val{session}]'
toggle-highlighter window/nl number-lines
toggle-highlighter window/nlr number-lines -relative
toggle-highlighter window/col column 80 ,bright-black@WrapMarker
toggle-highlighter window/col column 120 ,bright-black@WrapMarker
set-option -add window completers 'option=lsp_completions'
set-option -remove window completers 'option=lsp_completions'
