#!/bin/bash

if [ ! -s output.log ]; then
	rm -f output.log
	exit 0
fi

echo
echo "Summary"
echo "-------"
echo

cat output.log

echo
