#!/bin/bash
# Build script for BetterBindings BeamNG mod
# Creates a distributable .zip file for BeamNG.drive mods folder

set -e

# Configuration
MOD_NAME="BetterBindings"
VERSION="${1:-dev}"
OUTPUT_DIR="dist"

# Get script directory (project root)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Building $MOD_NAME v$VERSION..."

# Clean previous builds
mkdir -p "$OUTPUT_DIR"

# Create the zip file
OUTPUT_FILE="$OUTPUT_DIR/${MOD_NAME}-${VERSION}.zip"
rm -f "$OUTPUT_FILE"

zip -r "$OUTPUT_FILE" lua scripts LICENSE README.md icon_96x96.png -x "*.DS_Store" -x "*__MACOSX*"

echo ""
echo "Build complete!"
echo "Output: $OUTPUT_FILE"
echo ""
