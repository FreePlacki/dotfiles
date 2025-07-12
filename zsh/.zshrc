autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

export BROWSER="librewolf"
export EDITOR="nvim"

export PATH="/usr/bin/kotlinc/bin:$PATH"
export PATH="/usr/local/MATLAB/R2024b/bin:$PATH"

export DOTNET_ROOT="$HOME/dotnet"
export PATH="$HOME/dotnet:$PATH"

export ANDROID_SDK_ROOT="$HOME/android-cmdtools"

alias e='exa'
alias el='exa --long --header --git --no-user'
alias t='exa --tree --level=2'
alias yay='paru'

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
# nvim tip:
echo '\n'
shuf -n 1 ~/nvim_keymaps.txt
# shuf -n 1 ~/quick_notes.md

eval $(thefuck --alias)

# block cursor
echo -ne '\e[1 q'
