#!/usr/bin/env bash
# apply_all.sh

find . -maxdepth 1 -name ".*" ! -name "." ! -name ".." ! -name ".git" ! -name ".gitignore" -print0 |
while IFS= read -r -d '' item ; do
	name=${item#./}
	echo "Linking $name to $HOME/$name"
	ln -sfn "$(readlink -f "$item")" "$HOME/$name"
done
