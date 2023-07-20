export EDITOR=nvim

autoload -U colors && colors
autoload -U compinit

zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

HISTSIZE=1000
SAVEHIST=1000
KEYTIMEOUT=10

setopt hist_ignore_all_dups
setopt inc_append_history
setopt share_history
setopt autocd

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias qutebrowser='qutebrowser-profile'

bindkey -s '^F' 'projectify\n'
