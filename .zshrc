### Environment Variables ###
export PATH=$PATH:/home/sandorjj/.local/bin
export EDITOR="nvim"
export LS_COLORS="fi=0:di=01;34:ln=36:ex=32"

### Aliases ###
alias ls="ls --color"
alias ll="ls -lah"
alias c="clear"

### Zinit ###
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### Plugins ###
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode

zinit light zsh-users/zsh-autosuggestions
zvm_after_init_commands+=("bindkey \"^y\" autosuggest-accept")

zinit light zsh-users/zsh-syntax-highlighting

zinit light zsh-users/zsh-completions
autoload -U compinit && compinit
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"
zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

### History ###
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zvm_after_init_commands+=("bindkey \"^p\" history-search-backward")
zvm_after_init_commands+=("bindkey \"^n\" history-search-forward")

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"
