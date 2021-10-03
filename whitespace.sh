#!/bin/bash

set -o errexit # set -e
set -o nounset # set -u

export LANG=C.UTF-8

function summary()
{
	local TEST="$1"
	local FILES="$2"

	[ -z "$FILES" ] && return

	echo "$TEST"
	echo "$FILES" | sed 's/^/\t/'
	echo
}

function trailing()
{
	local TEST="Trailing whitespace"
	local FILES

	FILES=$(grep -lR --exclude-dir='.git' --exclude='*.png' --exclude='SECURITY.md' '[[:space:]]$' || :)

	summary "$TEST" "$FILES"
}

function tabs()
{
	local TEST="Tabs in code"
	local FILES

	FILES=$(grep -lR --exclude='*' --include='*.[ch]' --exclude='jimsh0.c' --exclude='queue.h' '	' || :)

	summary "$TEST" "$FILES"
}

function space_tab()
{
	local TEST="Space-Tab"
	local FILES

	FILES=$(grep -lR --exclude-dir='.git' --exclude='*.png' --exclude='jimsh0.c' --exclude='queue.h' ' \	' || :)

	summary "$TEST" "$FILES"
}

function trailing_line()
{
	local TEST="Trailing Blank Line"
	local FILES=()
	local TAIL
	local i

	for i in $(find . \( -name .git -o -name queue.h -o -path './autosetup/*' -o -path './docs/*' \) -prune -o -type f -name '*.[ch]' -print | sed 's/^\.\///' | sort); do
		TAIL=$(tail -q -n1 $i)
		if [ -z "$TAIL" ]; then
			FILES+=("$i")
		fi
	done

	IFS=$'\n'
	summary "$TEST" "${FILES[*]}"
}

if [ $# -gt 0 ]; then
	if [ ! -d "$1" ]; then
		echo "error: '$1' is not a directory"
		exit 1
	fi
	cd "$1"
fi

trailing
tabs
space_tab
trailing_line
