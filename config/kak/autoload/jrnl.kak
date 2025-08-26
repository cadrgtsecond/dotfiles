# Recognise jrnl.sh journals as markdown
hook global BufCreate '(.*\.jrnl|.*/journal.txt)' %{
    set-option buffer filetype markdown
    addhl buffer/jrnltags regex '@\w+' 0:meta
    addhl buffer/jrnldate regex '^\[[\d\s:-]+\]' 0:comment
    # I like putting specific times into my journal
    addhl buffe/jrnltime regex '\d\d:\d\d(:\d\d)?(?!\])' 0:keyword
}

