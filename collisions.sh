#!/usr/bin/env bash
# Hash a bunch of random numbers as git would and check the first 6 digits
# for any collisions.
#
# Run like:
#
#     ./collisions.sh > /tmp/collision-collection

i=0

while true; do
    # Check to see if we found any collisions every 10,000 hashes

    if [[ $(( i % 10000 )) -eq 0 ]]; then
        if (( $(sort /tmp/collision-collection | uniq -c | sort -rn | head -n 1 | awk '{print $1}') > 1 )); then
            exit 0
        fi
    fi

    # sum=$(echo -n $i | git hash-object --stdin)
    sum=$(printf 'blob %s\0%s' ${#i} $i | sha1sum)
    echo "# $i"
    echo "${sum:0:6}"
    (( i++ ))
done
