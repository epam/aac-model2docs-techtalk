#!/bin/bash
set -euo pipefail

# Export Structurizr DSL and PlantUML files to PlantUML, PNG, and SVG formats
# Usage: ./export-diagrams.sh [file1 file2 ... output_dir] | [output_dir] | [file]

readonly DEFAULT_DSL_FILES=("models/skyassist/skyassist-model.dsl")
readonly DEFAULT_PUML_FILES=()
readonly JAVA_OPTS="-Djava.awt.headless=true"

export_dsl_file() {
    local dsl_file="$1" output_dir="$2"
    [[ ! -f "$dsl_file" ]] && echo "Warning: $dsl_file not found" && return 1
    
    local basename=$(basename "$dsl_file" .dsl)
    local subfolder="$output_dir/$basename"
    echo "Processing DSL: $dsl_file"
    
    mkdir -p "$subfolder"/{plantuml,png,svg}
    structurizr-cli export -w "$dsl_file" -f plantuml -o "$subfolder/plantuml" >/dev/null || return 1
    find "$subfolder/plantuml" -name "*-key.puml" -delete 2>/dev/null || true
    
    local count=$(find "$subfolder/plantuml" -name "*.puml" 2>/dev/null | wc -l)
    [[ "$count" -eq 0 ]] && echo "Warning: No PlantUML files generated" && return 1
    
    plantuml -tpng -o "../png" "$subfolder/plantuml"/*.puml >/dev/null 2>&1 &
    plantuml -tsvg -o "../svg" "$subfolder/plantuml"/*.puml >/dev/null 2>&1 &
    wait
    
    echo "✓ $basename: $count diagram(s) exported"
}

export_puml_file() {
    local puml_file="$1" output_dir="$2"
    [[ ! -f "$puml_file" ]] && echo "Warning: $puml_file not found" && return 1
    
    local basename=$(basename "$puml_file" .puml)
    local subfolder="$output_dir/$basename"
    echo "Processing PUML: $puml_file"
    
    mkdir -p "$subfolder"/{plantuml,png,svg}
    cp "$puml_file" "$subfolder/plantuml/" || return 1
    
    plantuml -tpng -o "../png" "$subfolder/plantuml/$basename.puml" >/dev/null 2>&1 &
    plantuml -tsvg -o "../svg" "$subfolder/plantuml/$basename.puml" >/dev/null 2>&1 &
    wait
    
    echo "✓ $basename: 1 diagram exported"
}

# Parse arguments
if [[ $# -ge 2 ]]; then
    input_files=("${@:1:$#-1}")
    output_dir="${@: -1}"
elif [[ $# -eq 1 && -f "$1" ]]; then
    input_files=("$1")
    output_dir="./exports"
elif [[ $# -eq 1 ]]; then
    input_files=("${DEFAULT_DSL_FILES[@]}" "${DEFAULT_PUML_FILES[@]}")
    output_dir="$1"
else
    input_files=("${DEFAULT_DSL_FILES[@]}" "${DEFAULT_PUML_FILES[@]}")
    output_dir="./exports"
fi

echo "Exporting ${#input_files[@]} file(s) to $output_dir"
rm -rf "$output_dir"
mkdir -p "$output_dir"

success=0 failed=0
for file in "${input_files[@]}"; do
    case "$file" in
        *.dsl)  export_dsl_file "$file" "$output_dir" && ((success++)) || ((failed++)) ;;
        *.puml) export_puml_file "$file" "$output_dir" && ((success++)) || ((failed++)) ;;
        *)      echo "Warning: Unsupported file type: $file"; ((failed++)) ;;
    esac
done

echo "Completed: $success succeeded, $failed failed"
exit 0
