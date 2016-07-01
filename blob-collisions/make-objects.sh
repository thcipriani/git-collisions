#!/usr/bin/env bash

COL_FILE="/tmp/collision-collection"

TEN_COLLISIONS=( $(sort "$COL_FILE" \
    | uniq -c \
    | sort -rn \
    | awk '$1 > 1 {print $2}' \
    | head) )

for collision in "${TEN_COLLISIONS[@]}"; do
    NUMS=( $(grep -B1 "^${collision}" "$COL_FILE" | awk '$1 == "#" {print $2}') )
    mkdir -p "$collision"
    pushd "$collision"
    for num in "${NUMS[@]}"; do
        printf '%b' "$num" > "$num"
    done
    popd
done
