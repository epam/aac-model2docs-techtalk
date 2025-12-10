#!/bin/bash
# Export Structurizr DSL diagrams and PlantUML files to PlantUML and SVG formats

export_dsl_file() {
    local DSL_FILE="$1"
    local BASE_OUTPUT_DIR="$2"
    
    [ ! -f "$DSL_FILE" ] && echo "Warning: $DSL_FILE not found" && return 1
    
    DSL_BASENAME=$(basename "$DSL_FILE" .dsl)
    local SUBFOLDER_DIR="$BASE_OUTPUT_DIR/$DSL_BASENAME"
    
    echo "Processing DSL: $DSL_FILE"
    
    mkdir -p "$SUBFOLDER_DIR/plantuml" "$SUBFOLDER_DIR/svg"

    # Export to PlantUML
    JAVA_TOOL_OPTIONS="-Djava.awt.headless=true" structurizr-cli export -w "$DSL_FILE" -f plantuml -o "$SUBFOLDER_DIR/plantuml" > /dev/null || return 1

    PUML_COUNT=$(find "$SUBFOLDER_DIR/plantuml" -name "*.puml" 2>/dev/null | wc -l)
    [ "$PUML_COUNT" -eq 0 ] && echo "Warning: No PlantUML files generated" && return 1

    # Generate SVG
    java -Djava.awt.headless=true -jar "${PLANTUML_JAR:-/usr/local/plantuml/plantuml.jar}" -tsvg -o "../svg" "$SUBFOLDER_DIR/plantuml"/*.puml > /dev/null 2>&1 &
    SVG_PID=$!
    
    wait $SVG_PID || true

    echo "✓ $DSL_BASENAME: $PUML_COUNT diagrams exported"
    return 0
}

export_puml_file() {
    local PUML_FILE="$1"
    local BASE_OUTPUT_DIR="$2"
    
    [ ! -f "$PUML_FILE" ] && echo "Warning: $PUML_FILE not found" && return 1
    
    PUML_BASENAME=$(basename "$PUML_FILE" .puml)
    local SUBFOLDER_DIR="$BASE_OUTPUT_DIR/$PUML_BASENAME"
    
    echo "Processing PUML: $PUML_FILE"
    
    mkdir -p "$SUBFOLDER_DIR/plantuml" "$SUBFOLDER_DIR/svg"

    # Copy source PUML file
    cp "$PUML_FILE" "$SUBFOLDER_DIR/plantuml/" || return 1

    # Generate SVG
    java -Djava.awt.headless=true -jar "${PLANTUML_JAR:-/usr/local/plantuml/plantuml.jar}" -tsvg -o "../svg" "$SUBFOLDER_DIR/plantuml/$PUML_BASENAME.puml" > /dev/null 2>&1 &
    SVG_PID=$!
    
    wait $SVG_PID || true

    echo "✓ $PUML_BASENAME: 1 diagram exported"
    return 0
}

# Main script
if [ $# -ge 2 ]; then
    INPUT_FILES=("${@:1:$#-1}")
    OUTPUT_DIR="${@: -1}"
elif [ $# -eq 1 ] && [ -f "$1" ]; then
    INPUT_FILES=("$1")
    OUTPUT_DIR="./exports"
elif [ $# -eq 1 ]; then
    INPUT_FILES=($(find models \( -path models/common -prune \) -o \( -name "*.dsl" -o -name "*.puml" \) -print | sort))
    OUTPUT_DIR="$1"
else
    INPUT_FILES=($(find models \( -path models/common -prune \) -o \( -name "*.dsl" -o -name "*.puml" \) -print | sort))
    OUTPUT_DIR="./exports"
fi

echo "Exporting ${#INPUT_FILES[@]} file(s) to $OUTPUT_DIR"
rm -rf "$OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"

# Build dynamic mapping
declare -A model_folders=()
for INPUT_FILE in "${INPUT_FILES[@]}"; do
    if [[ "$INPUT_FILE" == *.dsl ]]; then
        model_name=$(basename "$INPUT_FILE" .dsl)
    elif [[ "$INPUT_FILE" == *.puml ]]; then
        model_name=$(basename "$INPUT_FILE" .puml)
    fi
    folder_name=$(basename "$(dirname "$INPUT_FILE")")
    model_folders[$model_name]=$folder_name
done

EXPORT_COUNT=0
FAILED_COUNT=0

for INPUT_FILE in "${INPUT_FILES[@]}"; do
    if [[ "$INPUT_FILE" == *.dsl ]]; then
        if export_dsl_file "$INPUT_FILE" "$OUTPUT_DIR"; then
            ((EXPORT_COUNT++))
        else
            ((FAILED_COUNT++))
        fi
    elif [[ "$INPUT_FILE" == *.puml ]]; then
        if export_puml_file "$INPUT_FILE" "$OUTPUT_DIR"; then
            ((EXPORT_COUNT++))
        else
            ((FAILED_COUNT++))
        fi
    else
        echo "Warning: Unsupported file type: $INPUT_FILE"
        ((FAILED_COUNT++))
    fi
done

echo "Completed: $EXPORT_COUNT succeeded, $FAILED_COUNT failed"

# Post-process SVGs to docs/images/
echo "Post-processing SVGs to docs/images/"
rm -rf docs/images/*
mkdir -p docs/images

# Copy SVGs with folder structure and rename
for model_dir in "$OUTPUT_DIR"/*/; do
  model_name=$(basename "$model_dir")
  folder_name="${model_folders[$model_name]}"
  
  if [ -z "$folder_name" ]; then
    echo "Warning: No folder mapping for $model_name"
    continue
  fi
  
  mkdir -p "docs/images/$folder_name"
  
  # Copy and rename SVG files (remove structurizr- prefix)
  for svg_file in "$model_dir/svg"/*.svg; do
    if [ -f "$svg_file" ]; then
      filename=$(basename "$svg_file")
      new_filename="${filename#structurizr-}"
      cp "$svg_file" "docs/images/$folder_name/$new_filename"
      echo "Copied: $filename -> $folder_name/$new_filename"
    fi
  done
done

echo "Post-processing complete."
exit 0
