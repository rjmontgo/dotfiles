# Config for ZSH

autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

setopt autocd 		# auto change into the typed directory
stty stop undef 


HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="${XDG_CACHE_HOME:-HOME/.cache}/zsh/history"

# Basic auto/tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

alias tmux='tmux -u'


source /usr/share/zsh/plugins/zsh-vim-mode/zsh-vim-mode.plugin.zsh 2>/dev/null
source /usr/share/fzf/key-bindings.zsh 2>/dev/null
source /usr/share/zsh/plugins/fast-syntax-highlighting/F-Sy-H.plugin.zsh 2>/dev/null

# let <esc><esc> switch to normal mode instantly
bindkey -rpM viins '^[^['
bindkey -s ^f "tmux-sessionizer\n"
