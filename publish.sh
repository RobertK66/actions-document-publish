#!/bin/sh
echo "Script called with args: '$0' '$1' '$2' '$3' '$4'"

SOURCES=$1
DOCS=".publish-docs/"
DOCUMENT="${DOCS}/document.md"
#CONTENT="${DOCS}/content.md"
#STYLE="${DOCS}/style.md"

mkdir -p $DOCS && touch $DOCUMENT 
#&& touch $CONTENT && touch $STYLE

#echo "<style>@media print {.pagebreak { page-break-before: always; break-before: always; }}</style>" >> $STYLE

for file in $SOURCES; do (cat "${file}"; printf "\n<div class='pagebreak'>&nbsp;</div>\n\n") done > $DOCUMENT

#cat $STYLE >> $DOCUMENT
#cat $CONTENT >> $DOCUMENT



INPUT_INPUT_DIR=$DOCS \
INPUT_OUTPUT_DIR=$DOCS \
INPUT_BUILD_HTML=false \
INPUT_IMAGES_DIR=$2 \
INPUT_IMAGE_IMPORT=$3 \
INPUT_THEME=$4 \
INPUT_EXTEND_DEFAULT_THEME=true \
/usr/local/bin/markdown-to-pdf

echo "::set-output name=pdf::${DOCS}/document.pdf"
