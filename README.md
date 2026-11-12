# Dotfiles

Organizing dotfiles using [Stow](https://www.gnu.org/software/stow/).

## Details

### Shell

- [Fish](https://fishshell.com/)
	- [Tide](https://github.com/IlanCosman/tide)
	- [Fisher](https://github.com/jorgebucaran/fisher)

### Terminal e agente

- Tern (terminal)
- omp (agente CLI, plugin [ponytail](https://github.com/DietrichGebert/ponytail))
- [GitUi](https://github.com/extrawurst/gitui)

### Editor e ferramentas

- [Zed](https://zed.dev/)
- [mise](https://mise.jdx.dev/)

> Setup antigo (i3, polybar, zsh, alacritty) disponível nas tags `initial-archlinux` e `ubuntu`.

## Usage

Please follow ```install.sh``` steps manually just because its safer, for now.

To create links with `Stow` you can run the following script:

```sh
$ ./setup.sh
```

## Credits

Thank you [@theodorosidmar](https://github.com/theodorosidmar) for showing me `dotfiles` and how to organize configs "like a code". :heart:

Here is some very usefull links that I used to build my setup:

- [Archlinux Ultimate Install](https://github.com/helmuthdu/aui) To install OS
- [Dotfiles Github](https://dotfiles.github.io/) To take some inspirations about dotfiles
	- [dikiaap/dotfiles](https://github.com/dikiaap/dotfiles) Used to borrow some ideas
