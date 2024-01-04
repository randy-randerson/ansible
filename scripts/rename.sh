#!/bin/bash

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <directory> <prefix> <Rename files? yes/no> [additional arguments...]"
    exit 1
fi

directory="$1"
prefix="$2"

cd "$directory" || exit 1

counter=1

for file in *; do
    if [ -f "$file" ]; then
        new_name="${prefix}${counter}.${file##*.}"
        echo "$file --> $new_name"

        if [ "$3" == "yes" ]; then
            mv "$file" "$new_name"
        fi
        ((counter++))
    fi
done
