autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

git_prompt_info() {
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    local gstatus="$"
    local branch ahead behind

    branch=$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)
    [[ -z $branch ]] && branch="detached"

    # unstaged changes
    if ! git diff --quiet --ignore-submodules --; then gstatus="+"
    fi

    # staged changes
    if ! git diff --cached --quiet --ignore-submodules --; then gstatus="●"
    fi

    # untracked files
    if [[ -n $(git ls-files --others --exclude-standard 2>/dev/null) ]]; then gstatus="…"
    fi

    # ahead/behind counts — default to 0 if missing
    if git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then
      ahead=$(git rev-list --count @{u}..HEAD 2>/dev/null || echo 0)
      behind=$(git rev-list --count HEAD..@{u} 2>/dev/null || echo 0)
      [[ -z $ahead ]] && ahead=0
      [[ -z $behind ]] && behind=0
      (( ahead > 0 )) && gstatus+="↑${ahead}"
      (( behind > 0 )) && gstatus+="↓${behind}"
    fi

    printf " on %s%s" "%B%F{magenta}$branch%f%b" " %B%F{red}[$gstatus]%f%b"
  fi
}

setopt PROMPT_SUBST
PROMPT='
%B%F{cyan}%1~%f%b$(git_prompt_info)
%B%F{yellow}ζ%f%b '

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

# eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

nerdfetch
# nvim tip:
echo '\n'
shuf -n 1 ~/nvim_keymaps.txt
# shuf -n 1 ~/quick_notes.md

eval $(thefuck --alias)

# block cursor
# echo -ne '\e[5 q'
