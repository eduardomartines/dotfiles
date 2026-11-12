# Dotfiles

Organizing dotfiles using [Stow](https://www.gnu.org/software/stow/).

## Details

### Shell

- [Fish](https://fishshell.com/)
	- [Tide](https://github.com/IlanCosman/tide) and [Fisher](https://github.com/jorgebucaran/fisher) (installed on first launch via `fish_plugins`)

### Terminal and agent

- [Tern](https://tern.build/) (terminal — also installs and keeps [omp](https://github.com/can1357/oh-my-pi) updated)
	- MCP: chrome-devtools (`omp/.omp/agent/mcp.json`)
	- plugin [ponytail](https://github.com/DietrichGebert/ponytail) (`omp/.omp/plugins/`)

### Editor and tools

- [Zed](https://zed.dev/)
- [mise](https://mise.jdx.dev/) — bun, node, gitui, Bitwarden CLI
- [Bitwarden](https://bitwarden.com/) (snap; its SSH agent is used by fish/ssh)
- `gh` (GitHub git credentials)

### Git and SSH

- `git/` and `ssh/` are stow packages.
- **Nothing sensitive is tracked**: identity (`user.name`, `email`, `signingkey`) lives in `~/.gitconfig.local` and SSH hosts/identities in `~/.ssh/config.local` — both loaded via `include`, never committed.

> Old setup (i3, polybar, zsh, alacritty, tmux, vscode...) available in the `initial-archlinux` and `ubuntu` tags.

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
