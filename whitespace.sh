#!/bin/bash

Tests
	trailing whitespace
	tabs in code
	space tab
	tailing blank line

set -o errexit # set -e
set -o nounset # set -u

export LANG=C.UTF-8

function test_whitespace()
{
	TEST="Trailing whitespace"
	echo "$TEST"
	if grep -lR --exclude-dir='.git' --exclude='*.png' --exclude='SECURITY.md' '[[:space:]]$'; then
		SOFT_FAIL+=("$TEST")
	fi

	TEST="Tabs in code"
	echo "$TEST"
	if grep -lR --exclude='*' --include='*.[ch]' --exclude='jimsh0.c' --exclude='queue.h' '	'; then
		SOFT_FAIL+=("$TEST")
	fi

	TEST="Space-Tab"
	echo "$TEST"
	if grep -lR --exclude-dir='.git' --exclude='*.png' --exclude='jimsh0.c' --exclude='queue.h' ' \	'; then
		SOFT_FAIL+=("$TEST")
	fi
}

