#!/usr/bin/env bash
set -euo pipefail

DRY_RUN=0
ROOT=""

usage() {
  echo "Usage: $(basename "$0") [--dry-run] [directory]"
  exit 1
}

# Parse args
for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    -h|--help) usage ;;
    *)
      if [[ -z "$ROOT" ]]; then
        ROOT="$arg"
      else
        echo "Error: unexpected argument '$arg'"
        usage
      fi
      ;;
  esac
done

ROOT="${ROOT:-.}"

if [[ ! -d "$ROOT" ]]; then
  echo "Error: '$ROOT' is not a directory"
  exit 1
fi

# Split base + extension (handles .bashrc correctly)
split_name() {
  local name="$1"
  local base ext

  if [[ "$name" == .* && "$name" != *.* ]]; then
    base="$name"
    ext=""
  elif [[ "$name" == *.* ]]; then
    base="${name%.*}"
    ext=".${name##*.}"
  else
    base="$name"
    ext=""
  fi

  printf '%s\n%s\n' "$base" "$ext"
}

do_mv() {
  if (( DRY_RUN )); then
    printf 'DRY-RUN: mv -- %q %q\n' "$1" "$2"
  else
    mv -- "$1" "$2"
  fi
}

sanitize() {
  printf '%s' "$1" \
    | tr '[:upper:]' '[:lower:]' \
    | perl -pe '
        s/[[:space:]]+/_/g;

        # Replace disallowed runs with "-" ONLY if not adjacent to "_" or "-"
        s/(?<![_-])[^a-z0-9._-]+(?![_-])/-/g;

        # Otherwise drop remaining disallowed chars (those adjacent to "_" or "-")
        s/[^a-z0-9._-]+//g;

        # Collapse repeats
        s/-+/-/g;
        s/_+/_/g;

        # Never allow mixed separators like "_-" or "-_"
        s/[_-]{2,}/_/g;

        # Trim separators
        s/^[-_]+//;
        s/[-_]+$//;
      '
}


find "$ROOT" -depth -type f -print0 | while IFS= read -r -d '' filepath; do
  dir="$(dirname "$filepath")"
  filename="$(basename "$filepath")"

  read -r base ext < <(split_name "$filename")
  clean_base="$(sanitize "$base")"
  newname="${clean_base}${ext}"

  [[ "$filename" == "$newname" ]] && continue

  target="$dir/$newname"

  # Auto-dedupe
  if [[ -e "$target" ]]; then
    i=1
    while :; do
      candidate="$dir/${clean_base}_$i$ext"
      [[ ! -e "$candidate" ]] && {
        target="$candidate"
        break
      }
      ((i++))
    done
  fi

  do_mv "$filepath" "$target"
done
