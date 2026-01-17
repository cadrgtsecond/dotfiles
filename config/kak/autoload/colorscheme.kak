evaluate-commands %sh{
    . ~/.config/themes/main
    set -eu
    ## code
    cat <<END
        face global value rgb:${value}
        face global type rgb:${type}+b
        face global identifier rgb:${identifier}
        face global string rgb:${string}
        face global keyword rgb:${keyword}+b
        face global operator rgb:${operator}
        face global attribute rgb:${attribute}
        face global comment rgb:${comment}
        face global meta rgb:${meta}
        face global builtin rgb:${bulitin}+b

        face global title rgb:${title}+b
        face global header rgb:${header}+b
        face global bold rgb:${bold}+b
        face global italic rgb:${foreground}
        face global mono rgb:${mono_fg},rgb:${mono_bg}
        face global block rgb:${block_fg},rgb:${block_bg}
        face global link rgb:${link}
        face global bullet rgb:${bullet}
        face global list rgb:${list}

        face global Default rgb:${foreground},rgba:${background}99
        face global PrimarySelection rgb:${selection_fg},rgba:${selection_bg}e0
        face global SecondarySelection rgb:${selection_alt_fg},rgb:${selection_alt_bg}
        face global PrimaryCursor rgb:${cursor_fg},rgb:${cursor_bg}
        face global SecondaryCursor rgb:${cursor_alt_fg},rgb:${cursor_alt_bg}
        face global LineNumbers rgb:${lineno_fg},rgba:${lineno_bg}ef
        face global LineNumberCursor rgb:${lineno_sel_fg},rgb:${lineno_sel_bg}
        face global MenuForeground rgb:${menu_sel_fg},rgb:${menu_sel_bg}
        face global MenuBackground rgb:${menu_fg},rgb:${menu_bg}
        face global MenuInfo rgb:${menu_info_fg},rgb:${menu_info_bg}
        face global Information rgb:${info_fg},rgb:${info_bg}
        face global Error rgb:${error_fg},rgb:${error_bg}
        face global StatusLine rgb:${status_line_fg},rgb:${status_line_bg}
        face global StatusLineMode rgb:${status_line_mode_fg},rgb:${status_line_mode_bg}
        face global StatusLineInfo rgb:${status_line_info_fg},rgb:${status_line_info_bg}
        face global StatusLineValue rgb:${status_line_value_fg},rgb:${status_line_value_bg}
        face global StatusCursor rgb:${status_line_cursor_fg},rgb:${status_line_cursor_bg}
        face global Prompt rgb:${prompt_fg},rgb:${prompt_bg}
        face global MatchingChar rgb:${matching_char_fg},rgb:${matching_char_bg}+b
        face global BufferPadding rgb:${bufferpadding_fg},rgb:${bufferpadding_bg}
        set-option -add global ui_options \
            'mosham_black=rgb:${black}' \
            'mosham_red=rgb:${red}' \
            'mosham_green=rgb:${green}' \
            'mosham_yellow=rgb:${yellow}' \
            'mosham_blue=rgb:${blue}' \
            'mosham_magenta=rgb:${magenta}' \
            'mosham_cyan=rgb:${cyan}' \
            'mosham_white=rgb:${white}' \
            'mosham_bright_black=rgb:${bright_black}' \
            'mosham_bright_red=rgb:${bright_red}' \
            'mosham_bright_green=rgb:${bright_green}' \
            'mosham_bright_yellow=rgb:${bright_yellow}' \
            'mosham_bright_blue=rgb:${bright_blue}' \
            'mosham_bright_magenta=rgb:${bright_magenta}' \
            'mosham_bright_cyan=rgb:${bright_cyan}' \
            'mosham_bright_white=rgb:${bright_white}'
END
}
