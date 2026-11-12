#!/bin/bash

base=(
	fish
	tern
	omp
)

code=(
	zed
	mise
	gitui
)

apps=( "${base[@]}" "${code[@]}" )

echo "Stowing apps for user: ${whoami}"
echo ""

git submodule init
git submodule update

for app in ${apps[@]}; do
	stow -v -R -t ${HOME} $app
done

echo ""
echo "Stowed some apps."
