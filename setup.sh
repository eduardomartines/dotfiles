#!/bin/bash

base=(
	zshrc
	oh-my-zsh
)

system=(
	i3
	polybar
)

code=(
	alacritty
	gemrc
)

apps=( "${base[@]}" "${system[@]}" "${code[@]}" )

echo "Stowing apps for user: ${whoami}"
echo ""

git submodule init
git submodule update

for app in ${apps[@]}; do
	stow -v -R -t ${HOME} $app
done

echo ""
echo "Stowed some apps."
