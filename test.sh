#!/usr/bin/env sh

DID_FAIL=0

FAIL_TOTAL=0
PASS_TOTAL=0

fail() {
        printf "\e[31m%s \e[m%s\n" "FAIL" "$@"
        FAIL_TOTAL=$(($FAIL_TOTAL + 1))
        DID_FAIL=1
}

pass() {
        printf "\e[32m%s \e[m\n" "PASS"
        PASS_TOTAL=$(($PASS_TOTAL + 1))
}

exists() {
        if [[ -e "$@" ]]; then
                pass "File exists $@"
        else
                fail "File does not exist $@"
        fi
}

file_compare () {
        if [[ "$(cat "$1")" == "$(cat "$2")" ]]; then
                pass "$1 == $2" 
        else
                fail "File '$1' does not match '$2'"
        fi
}

test_exists() {
        for i in "$@"; do
                exists "$HOME/$i"
        done
}

test_compare() {
        for i in "$@"; do
                file_compare "$HOME/$i" "$PWD/$i"
        done
}

FILES=".bashrc .bash_profile .hushlogin .inputrc .profile .vimrc"

printf "\nRunning Tests...\n\n"

test_exists $FILES
test_compare $FILES

printf "\nTOTAL\n\n"
printf "Fail: $FAIL_TOTAL\n"
printf "Pass: $PASS_TOTAL\n\n"

[[ $DID_FAIL -eq 1 ]] && exit 1 || exit 0
