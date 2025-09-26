#!/usr/bin/env bash

OUTPUT_DIR="deflicked"

deflickMP4() {
  mkdir -p "$OUTPUT_DIR"

  echo "deflicking mp4's in $PWD and outputting to $OUTPUT_DIR ..."
  
  for f in *.mp4; do
    NAME="${f::-4}--deflicked.mp4"
    echo "$f -> $OUTPUT_DIR/$NAME"
    ffmpeg -i "$f" -vf "tmix=frames=4:weights=1 1 50 50" -c:a copy "$OUTPUT_DIR/$NAME"
  done
}
