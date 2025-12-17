#!/usr/bin/env bash

shopt -s globstar nullglob

for f in **/*.mp3; do
  ffmpeg -y -i "$f" "${f%.mp3}.flac"
done
