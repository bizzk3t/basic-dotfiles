#!/usr/bin/env bash

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

test_ls_aliases() {
        source $HOME/.bashrc
        alias ls
        alias l
        alias a
        alias la
        alias ll
}

main() {
        set -e
        test_files_exist
        test_ls_aliases
}
main
