#include <current-theme.h>

printf "
\\033]11;rgb:BACKGROUND_1\\a
\\033]10;rgb:FOREGROUND_1\\a
\\033]4;0;rgb:BLACK\\a
\\033]4;1;rgb:RED\\a
\\033]4;2;rgb:GREEN\\a
\\033]4;3;rgb:YELLOW\\a
\\033]4;4;rgb:BLUE\\a
\\033]4;5;rgb:MAGENTA\\a
\\033]4;6;rgb:CYAN\\a
\\033]4;7;rgb:WHITE\\a

\\033]4;8;rgb:BRIGHT_BLACK\\a
\\033]4;9;rgb:BRIGHT_RED\\a
\\033]4;10;rgb:BRIGHT_GREEN\\a
\\033]4;11;rgb:BRIGHT_YELLOW\\a
\\033]4;12;rgb:BRIGHT_BLUE\\a
\\033]4;13;rgb:BRIGHT_MAGENTA\\a
\\033]4;14;rgb:BRIGHT_CYAN\\a
\\033]4;15;rgb:BRIGHT_WHITE\\a
        " | sed -E 's#rgb:(..)(..)(..)#rgb:\1/\2/\3#g' | tr -d '\n '
printf ~/.local/bin/scripts/set_theme | entr -nzp true
exec set_theme
