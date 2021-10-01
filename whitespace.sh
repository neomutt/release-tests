#!/bin/bash

Always exclude
	.git/
	*.png
	3rd party
		mtt/queue.h
		test/acutest.h
		autosetup/jimsh0.c
		autosetup/* (not mutt-*)

Main Source
	*.[ch]
	*/*.[ch]
	excluding test/**

Test source
	test/*.[ch]
	test/*/*.[ch]

Makefiles
	auto.def
	configure
	Makefile.autosetup
	*/Makefile.autosetup

Translations
	po/*.po
	po/POTFILES.in

Docs
	*.md
	*/*.md
	*/*/*.md
	docs/*.[15]
	docs/* (misc)

Scripts (bash)
	*/*.sh
	*/*/*.sh

Yaml
	*.yml
	*/*.yml
	*/*/*.yml

Tcl
	autosetup/mutt-gettext.tcl
	autosetup/mutt-iconv.tcl

Contrib
	contrib/** (misc)
	scripts, config

Doxygen
	doxygen/* (misc)

Config
	.??*
	.github/CODEOWNERS

Tests
	trailing whitespace
	tabs in code
	space tab
	tailing blank line

