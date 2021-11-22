#!/bin/bash

shopt -s nullglob
shopt -s globstar

SELF="${0%.sh}"
MATCH="${SELF}-match.txt"
IGNORE="${SELF}-ignore.txt"

TMP_FILE=$(mktemp)

function config_test()
{
	# grep "^#include"
	# config.h
}

export IFS=$'\n'
cat "$MATCH" | while read -r glob; do
	list=($glob)
	echo "${list[*]}"
done | sort -u | grep -v -f "$IGNORE" > "$TMP_FILE"

for i in $(cat "$TMP_FILE"); do
	config_test "$i"
done


# # list=(*.c)
# list=($1)
# echo "${#list[@]}"
# # echo "${list[@]}"

# for file in "${list[@]}"; do
# 	if [[ "$file" =~ $2 ]]; then
# 		echo -e "\e[1;31m$file\e[0m"
# 	else
# 		echo "$file"
# 	fi
# done
#
# find . \( -name .git -o -name queue.h -o -path './test/*' -o -path './autosetup/*' -o -path './docs/*' \) -prune -o -type f -name '*.[ch]' -print | sed 's/^\.\///' | sort

