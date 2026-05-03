hook global WinSetOption filetype=(markdown|asciidoc) %{
    add-highlighter window/ wrap -width 100 -word -indent
}
