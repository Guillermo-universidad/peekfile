#!/usr/bin/env bash

# peek.sh - show the head and tail of a text file
# Usage: ./peek.sh <file> [lines]   (lines defaults to 3)

file="$1"
lines="${2:-3}"   # default to 3 when the argument is missing or empty

if [ $# -lt 1 ] || [ -z "$file" ]; then
    echo "Usage: ./peek.sh <file> [lines]" >&2
    exit 1
fi

if [ ! -f "$file" ]; then
    echo "Error: '$file' is not a file." >&2
    exit 1
fi

total=$(wc -l < "$file")

if [ "$total" -le $((2 * lines)) ]; then
    # short file: show everything
    cat "$file"
else
    echo "Warning: file has $total lines; showing first and last $lines."
    head -n "$lines" "$file"
    echo "..."
    tail -n "$lines" "$file"
fi

