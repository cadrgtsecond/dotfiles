hook global BufCreate .*(tal) %{
    set buffer filetype tal
}

hook global WinSetOption filetype=tal %{
    require-module tal
    add-highlighter window/ ref tal
}

provide-module tal %[

add-highlighter shared/tal regions
add-highlighter shared/tal/code default-region group
add-highlighter shared/tal/comment region "\( " " \)"       fill comment
add-highlighter shared/tal/code/ regex "[,;.&~][^\t \n\r]+" 0:variable
add-highlighter shared/tal/code/ regex '["#|$][^\t \n\r]+'  0:value
add-highlighter shared/tal/code/ regex "'[^\t \n\r]+"       0:value
add-highlighter shared/tal/code/ regex '[%][^\t \n\r]+'     0:type
add-highlighter shared/tal/code/ regex '[@][^\t \n\r]+'     0:meta

add-highlighter shared/tal/code/ regex "\s(BRK|LIT|INC|POP|DUP|NIP|SWP|OVR|ROT|EQU|NEQ|GTH|LTH|JMP|JCN|JSR|STH|LDZ|STZ|LDR|STR|LDA|STA|DEI|DEO|ADD|SUB|MUL|DIV|AND|ORA|EOR|SFT)[2rk]{0,3}(?=\s)" 0:keyword

]
