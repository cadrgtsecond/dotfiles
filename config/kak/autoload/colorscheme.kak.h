#include <current-theme.h>

face global value rgb:NUMBER
face global type rgb:TYPE,+b
face global identifier rgb:VARIABLE
face global string rgb:STRING
face global keyword rgb:KEYWORD
face global operator rgb:OPERATOR
face global attribute rgb:METAPROGRAMMING
face global comment rgb:COMMENT
face global meta rgb:METAPROGRAMMING
face global module rgb:METAPROGRAMMING
face global builtin rgb:BUILTIN

face global title rgb:HEADING,+b
face global header rgb:HEADING
face global bold rgb:FOREGROUND_2+b
face global italic default+i
face global mono ,rgb:MONOSPACE_BACKGROUND
face global block ,rgb:MONOSPACE_BACKGROUND
face global link rgb:STRING
face global bullet rgb:OPERATOR
face global list rgb:OPERATOR

face global Default rgb:FOREGROUND_1,rgb:BACKGROUND_1
face global PrimarySelection   rgb:PRIMARY_SELECTION_FOREGROUND,rgb:PRIMARY_SELECTION_BACKGROUND
face global SecondarySelection rgb:SECONDARY_SELECTION_FOREGROUND,rgb:SECONDARY_SELECTION_BACKGROUND
face global PrimaryCursor      rgb:BACKGROUND_1,rgb:PRIMARY_CURSOR_BACKGROUND
face global SecondaryCursor    rgb:BACKGROUND_1,rgb:SECONDARY_CURSOR_BACKGROUND
face global LineNumbers rgb:FOREGROUND_3,rgb:BACKGROUND_1
face global LineNumberCursor rgb:FOREGROUND_2,rgb:BACKGROUND_2
face global MenuForeground rgb:BACKGROUND_1,rgb:OPERATOR@+b
face global MenuBackground rgb:FOREGROUND_2,rgb:BACKGROUND_2
face global MenuInfo       rgb:FOREGROUND_1,rgb:BACKGROUND_2
face global Information    MenuInfo
face global InlineInformation    rgb:COMMENT,+i

face global Error          rgb:ERROR,rgb:BACKGROUND_1
face global StatusLine     rgb:FOREGROUND_1,rgb:BACKGROUND_2

face global StatusLineMode rgb:OPERATOR,+b
face global StatusLineInfo rgb:KEYWORD
face global StatusLineValue rgb:NUMBER
face global StatusCursor rgb:BACKGROUND_1,rgb:VARIABLE+b

face global Prompt rgb:OPERATOR,rgb:BACKGROUND_1
face global MatchingChar rgb:MATCHING_DELIMITER,rgb:BACKGROUND_1
face global BufferPadding rgb:FOREGROUND_2,rgb:BACKGROUND_1

face global Whitespace rgb:WHITESPACE,+f
face global WrapMarker rgb:WHITESPACE,+f

set-option -add global ui_options 'mosham_black=rgb:BLACK'
set-option -add global ui_options 'mosham_red=rgb:RED'
set-option -add global ui_options 'mosham_green=rgb:GREEN'
set-option -add global ui_options 'mosham_yellow=rgb:YELLOW'
set-option -add global ui_options 'mosham_blue=rgb:BLUE'
set-option -add global ui_options 'mosham_magenta=rgb:MAGENTA'
set-option -add global ui_options 'mosham_cyan=rgb:CYAN'
set-option -add global ui_options 'mosham_white=rgb:WHITE'
set-option -add global ui_options 'mosham_bright_black=rgb:BRIGHT_BLACK'
set-option -add global ui_options 'mosham_bright_red=rgb:BRIGHT_RED'
set-option -add global ui_options 'mosham_bright_green=rgb:BRIGHT_GREEN'
set-option -add global ui_options 'mosham_bright_yellow=rgb:BRIGHT_YELLOW'
set-option -add global ui_options 'mosham_bright_blue=rgb:BRIGHT_BLUE'
set-option -add global ui_options 'mosham_bright_magenta=rgb:BRIGHT_MAGENTA'
set-option -add global ui_options 'mosham_bright_cyan=rgb:BRIGHT_CYAN'
set-option -add global ui_options 'mosham_bright_white=rgb:BRIGHT_WHITE'
