redo-ifchange ../themes/current-theme.h set_theme.h

echo "#!/bin/sh" > "$3"
preprocess -I ../themes set_theme.h > "$3"
chmod +x "$3"
