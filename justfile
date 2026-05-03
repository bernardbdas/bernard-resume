# List available commands
default:
    @just --list

# Build the ATS resume
build-ats:
    @echo "Building ATS resume..."
    cd ats && latexmk -pdf main.tex

# Build the Visual resume
build-visual:
    @echo "Building Visual resume..."
    cd visual && latexmk -pdf main.tex

# Build both ATS and Visual resumes
build: build-ats build-visual

# Format a specific file
format-file file:
    @echo "Formatting {{file}}..."
    tex-fmt "{{file}}"

# Format ATS resume .tex and .cls files
format-ats:
    @echo "Formatting ATS resume files..."
    @find ats -type f -name "*.tex" -exec tex-fmt {} + || true
    @find ats -type f -name "*.cls" -exec tex-fmt {} + || true

# Format Visual resume .tex and .cls files
format-visual:
    @echo "Formatting Visual resume files..."
    @find visual -type f -name "*.tex" -exec tex-fmt {} + || true
    @find visual -type f -name "*.cls" -exec tex-fmt {} + || true

# Format all files
format-all: format-ats format-visual

# Clean ATS resume auxiliary files recursively
clean-ats:
    @echo "Cleaning ATS auxiliary files..."
    @find ats -type f -name "*.aux" -delete
    @find ats -type f -name "*.fdb_latexmk" -delete
    @find ats -type f -name "*.fls" -delete
    @find ats -type f -name "*.log" -delete
    @find ats -type f -name "*.out" -delete
    @find ats -type f -name "*.synctex.gz" -delete
    @find ats -type f -name "*.toc" -delete
    @find ats -type f -name "*.bbl" -delete
    @find ats -type f -name "*.bcf" -delete
    @find ats -type f -name "*.blg" -delete
    @find ats -type f -name "*.run.xml" -delete

# Clean Visual resume auxiliary files recursively
clean-visual:
    @echo "Cleaning Visual auxiliary files..."
    @find visual -type f -name "*.aux" -delete
    @find visual -type f -name "*.fdb_latexmk" -delete
    @find visual -type f -name "*.fls" -delete
    @find visual -type f -name "*.log" -delete
    @find visual -type f -name "*.out" -delete
    @find visual -type f -name "*.synctex.gz" -delete
    @find visual -type f -name "*.toc" -delete
    @find visual -type f -name "*.bbl" -delete
    @find visual -type f -name "*.bcf" -delete
    @find visual -type f -name "*.blg" -delete
    @find visual -type f -name "*.run.xml" -delete

# Clean all auxiliary files
clean-all: clean-ats clean-visual
