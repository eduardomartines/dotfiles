# Dotfiles

Organizing dotfiles using [Stow](https://www.gnu.org/software/stow/).

## Details

### Shell

- [Fish](https://fishshell.com/)
	- [Tide](https://github.com/IlanCosman/tide) e [Fisher](https://github.com/jorgebucaran/fisher) (instalados no primeiro start via `fish_plugins`)

### Terminal e agente

- [Tern](https://tern.build/) (terminal — também instala e atualiza o [omp](https://github.com/can1357/oh-my-pi))
	- MCP: chrome-devtools (`omp/.omp/agent/mcp.json`)
	- plugin [ponytail](https://github.com/DietrichGebert/ponytail) (`omp/.omp/plugins/`)

### Editor e ferramentas

- [Zed](https://zed.dev/)
- [mise](https://mise.jdx.dev/) — bun, node, gitui, Bitwarden CLI
- [Bitwarden](https://bitwarden.com/) (snap; o agente SSH é usado pelo fish/ssh)
- `gh` (credenciais git do GitHub)

### Git e SSH

- `git/` e `ssh/` são stow packages.
- **Nada sensível versionado**: identidade (`user.name`, `email`, `signingkey`) fica em `~/.gitconfig.local` e hosts/identidades SSH em `~/.ssh/config.local` — ambos carregados via `include` e nunca commitados.

> Setup antigo (i3, polybar, zsh, alacritty, tmux, vscode...) disponível nas tags `initial-archlinux` e `ubuntu`.

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
