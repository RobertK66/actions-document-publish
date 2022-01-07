#!/bin/sh

SOURCES=$1
DOCS=".publish-docs/"
DOCUMENT="${DOCS}/document.md"

mkdir -p $DOCS && touch $DOCUMENT

for file in $SOURCES; do (cat "${file}"; echo) done > $DOCUMENT

echo "Script called with args: '$0' '$1' '$2' '$3'"

INPUT_INPUT_DIR=$DOCS \
INPUT_OUTPUT_DIR=$DOCS \
INPUT_BUILD_HTML=false \
INPUT_IMAGES_DIR=$1 \
INPUT_IMAGE_IMPORT=$2 \
/usr/local/bin/markdown-to-pdf

echo "::set-output name=pdf::${DOCS}/document.pdf"
