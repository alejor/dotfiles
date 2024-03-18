HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
EDITOR=kak
PAGER=most
PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

unsetopt autocd
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
bindkey -v

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '\M- ' autosuggest-accept

alias gi='gini chat'
