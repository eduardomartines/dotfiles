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

configs=(
	git
	ssh
)

apps=( "${base[@]}" "${code[@]}" "${configs[@]}" )

echo "Stowing apps for user: ${whoami}"
echo ""

for app in ${apps[@]}; do
	stow -v -R -t ${HOME} $app
done

echo ""
echo "Stowed some apps."
