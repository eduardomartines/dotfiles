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
	# --no-folding: link files individually so runtime state (omp dbs, fish vars)
	# is written next to the links, never inside this repo.
	# --adopt: on machines with existing real configs, take them over instead of conflicting.
	stow -v -R --no-folding --adopt -t ${HOME} $app
done

echo ""
echo "Stowed some apps."
