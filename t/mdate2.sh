#! /bin/sh
# Copyright (C) 1996-2021 Free Software Foundation, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

# Test to make sure mdate-sh is included in distribution.

. test-init.sh

cat > Makefile.am << 'END'
info_TEXINFOS = textutils.texi
END

cat > textutils.texi << 'END'
@include version.texi
END

# Required when using Texinfo.
: > texinfo.tex
: > mdate-sh
echo '@setfilename textutils.info' > textutils.texi

# Use "././" to confuse Automake into thinking this is a subdir build.
$ACLOCAL
$AUTOMAKE ././Makefile

grep 'mdate-sh' Makefile.in | grep -v SHELL

:
