#!/usr/bin/env sh

test_files_exist() {
        FILES="$(find $PWD/src -mindepth 1 -maxdepth 1 -name '*' -exec basename {} \;)"

        printf "\nRunning Tests...\n\n"

        for i in $FILES; do
                local fname="$HOME/$i"
                if [ ! -d "$fname" ]; then
                        test -f "$fname"
                        cmp -s "$fname" "$PWD/src/$i"
                fi
        done
}

main() {
        set -e
        test_files_exist
}
main
