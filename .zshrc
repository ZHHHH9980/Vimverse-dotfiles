if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting z vi-mode)

source $ZSH/oh-my-zsh.sh

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne "\e[2 q"    else
    echo -ne "\e[6 q"    fi
}
zle -N zle-keymap-select

alias gu="gitui"
alias n="nvim"

source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh