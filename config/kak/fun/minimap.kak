declare-option str minimap_text
declare-option str minimap_fg %sh{TERM=xterm xtermcontrol --get-fg < /dev/tty | sed -e 's/rgb:\(..\)..\/\(..\)..\/\(..\)../#\1\2\3/g'}

define-command generate_minimap %{
    set-option window minimap_text %sh{
        magick -font Iosevka \
          -background "none" -fill "$kak_opt_minimap_fg" \
          "text:$kak_buffile" -scale 100x600 "png:-" | chafa -f sixels -
    }
}

define-command enable-minimap %{
    hook window NormalIdle .* %{
        nop %sh{
            exec > /dev/tty
            printf "\033[s\033[0;$(( $(tput cols < /dev/tty) - 10 ))H"
            echo "$kak_opt_minimap_text"
            printf "\033[u"
        }
    }
    generate_minimap
}
