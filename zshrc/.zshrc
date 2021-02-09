export ZSH="${HOME}/.oh-my-zsh"

#
# Spaceship config
#
# ZSH_THEME="spaceship-prompt/spaceship"
# SPACESHIP_PROMPT_ORDER=(
#   user          # Username section
#   dir           # Current directory section
#   host          # Hostname section
#   git           # Git section (git_branch + git_status)
#   hg            # Mercurial section (hg_branch  + hg_status)
#   exec_time     # Execution time
#   line_sep      # Line break
#   vi_mode       # Vi-mode indicator
#   jobs          # Background jobs indicator
#   exit_code     # Exit code section
#   char          # Prompt character
# )
# SPACESHIP_USER_SHOW=always
# SPACESHIP_PROMPT_ADD_NEWLINE=false
# SPACESHIP_CHAR_SYMBOL="❯"
# SPACESHIP_CHAR_SUFFIX=" "

#
# powerline10k config
#
ZSH_THEME="powerlevel10k/powerlevel10k"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

CASE_SENSITIVE="false"

#
# plugins
#
plugins=(git tmux tmuxinator nvm yarn virtualenv rbenv docker docker-compose)

source $ZSH/oh-my-zsh.sh

export XDG_CONFIG_HOME="$HOME/.config"
export TMUX_PLUGIN_MANAGER_PATH="$XDG_CONFIG_HOME/tmux/plugins"

#
# nvm
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#
# rbenv
#
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#
# text editor
#
export EDITOR="vim"

#
# yarn
#
export PATH="$PATH:$(yarn global bin)"

#
# cargo
#
export PATH="$HOME/.cargo/bin:$PATH"

#
# Android SDK
#
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$PATH:$ANDROID_HOME/emulator:$PATH"
export PATH="$PATH:$ANDROID_HOME/tools:$PATH"
export PATH="$PATH:$ANDROID_HOME/tools/bin:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

#
# aliases
#
alias zshconfig="${EDITOR} ~/.zshrc"
alias ohmyzsh="${EDITOR} ~/.oh-my-zsh/oh-my-zsh.sh"
alias powerline10k="p10k configure"
alias reload="source ~/.zshrc"

alias la="ls -la"

alias tmux="tmux -f '$XDG_CONFIG_HOME/tmux/tmux.conf'"
alias p='f() { cd ~/projects/$1 };f'
alias dotfiles="p dotfiles"

#
# aliases from tmuxinator plugin
#
# alias ta="tmux attach -t"
# alias tad="tmux attach -d -t"
# alias ts="tmux new-session -s"
# alias tl="tmux list-sessions"
# alias tksv="tmux kill-server"
# alias tkss="tmux kill-session -t"

#
# aliases from tmuxinator plugin
#
# alias txs="tmuxinator start"
# alias txo="tmuxinator open"
# alias txn="tmuxinator new"
# alias txl="tmuxinator list"
