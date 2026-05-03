format file:
    @echo "Formatting {{file}}..."
    tex-fmt "{{file}}"

format-all:
    @echo "Formatting all .tex files..."
    @find . -type f -name "*.tex" -exec tex-fmt {} +