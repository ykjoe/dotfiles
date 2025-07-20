#!/usr/bin/env bash
# apply_all.sh

find . -maxdepth 1 -name ".*" ! -name "." ! -name ".." | 
while IFS= read -r -d '' item ; do
	name=${item#./}
	ln -sfn "$(readlink -f "$item")" "$HOME/$name"
done

