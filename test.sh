#!/usr/bin/env sh

DID_FAIL=0

print_color() {
        printf "\e[3%sm%s\e[m" "$1" "$2"
}

print_red() {
        print_color 1 "$1"
}

print_green() {
        print_color 2 "$1"
}

print_success() {
        print_green "PASS $1\n"
}

print_error() {
        print_red "FAIL $1 $2\n"
}

print_result() {
        if [ "$1" -eq 0 ]; then
                print_success "$2"
        else
                print_error "$2"
                DID_FAIL=1
        fi
        return "$1"
}

main() {

        FILES="$(find $PWD/src -name '*' -mindepth 1 -maxdepth 1 -exec basename {} \;)"

        printf "\nRunning Tests...\n\n"

        for i in $FILES; do
                local fname="$HOME/$i"
                if [ ! -d "$fname" ]; then
                        test -f "$fname"
                        print_result $? "File Exists"

                        cmp -s "$fname" "$PWD/src/$i"
                        print_result $? "Files are equal"
                fi
        done
        print_result $DID_FAIL "Checking Files"
}

main
