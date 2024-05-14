autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

alias e='exa'
alias el='exa --long --header --git --no-user'
alias t='exa --tree --level=2'

# alias cp="cp -i"
# alias mv="mv -i"
# alias rm="rm -i"

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"
plug "Aloxaf/fzf-tab"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

nerdfetch
