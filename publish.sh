#!/bin/sh
echo "Script called with args: '$0' '$1' '$2' '$3' '$4'"

SOURCES=$1
DOCS=".publish-docs/"
DOCUMENT="${DOCS}/document.md"

mkdir -p $DOCS && touch $DOCUMENT 

skipFirst=TRUE
for file in $SOURCES; do 
  if [ $skipFirst = True ] ; then
    skipFirst=FALSE
    (cat "${file}"; )         
  else
    (printf "\n<div class='pagebreak'>&nbsp;</div>\n\n"; cat "${file}"; ) 
  fi
done > $DOCUMENT

cp /publish.css /github/workspace/publish.css

INPUT_INPUT_DIR=$DOCS \
INPUT_OUTPUT_DIR=$DOCS \
INPUT_BUILD_HTML=false \
INPUT_IMAGES_DIR=$2 \
INPUT_IMAGE_IMPORT=$3 \
INPUT_THEME=publish.css \
INPUT_EXTEND_DEFAULT_THEME=true \
/usr/local/bin/markdown-to-pdf

echo "::set-output name=pdf::${DOCS}/document.pdf"
