#!/bin/sh
case "$1" in --pids) SEL=2;; --procs) SEL=1;;
	--files|*) SEL=9;;
esac; for tree in home proc dev usr var; do 
echo -n "/$tree: "; lsof -w -n -a -d0-10 -a +D \
	/$tree|grep '[0-9][urw]'|awk --assign VAR="$SEL" \
	'{print $VAR}'|sort|uniq|xargs; done; exit 0
