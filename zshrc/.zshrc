eval "$(/opt/homebrew/bin/brew shellenv)"

# PATH
export EDITOR="nvim"
export NVIM_DIR="$HOME/dev/nvim-macos-arm64/bin"

export PATH="$HOME/.local/bin:$NVIM_DIR":$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zinit DIR
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if doesnt exist
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# ZSH Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Keybinding
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
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

# Completion styling
zstyle ':completions:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completions:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completions:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# Aliases
alias ls='ls -lah --color'
alias v='nvim'
alias c='clear'
# temporary
alias python=/usr/bin/python3
# alias python=/Library/Frameworks/Python.framework/Versions/3.12/bin/python3
# alias mysql=/usr/local/mysql/bin/mysql
alias gpbt="git push git@github.com:bbs-lms/bbs-teacher.git"
alias gpbs="git push git@github.com:bbs-lms/bbs-student.git"
alias gpm="git push git@github.com:bbs-lms/bbs-teacher.git && git push git@github.com:bbs-lms/bbs-student.git"
# alias emu="./Library/Android/sdk/emulator/emulator" # emulator

# Yazi setup
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
# export ICU_ROOT=$(brew --prefix icu4c)
# export LDFLAGS="-L$ICU_ROOT/lib"
# export CPPFLAGS="-I$ICU_ROOT/include"
# export PKG_CONFIG_PATH="$ICU_ROOT/lib/pkgconfig"

# #kevind.dwiputra6
# export GEMINI_API_KEY="AIzaSyBqm_e6LGm7LwnuvgF7Uo_H93qHHl2_OGM"
# # enokki
# export GEMINI_API_KEY="AIzaSyAWiXWFy6IzGGFc8VsvsdKVzPESVbmtjbY"
#  kevindptr
# export GEMINI_API_KEY="AIzaSyBuZhgc_NDxZ7VEQjakKop6hW4lWbjuHCE"
# # bblekutek
# export GEMINI_API_KEY="AIzaSyBbOu2b2pEO8O92wKh770URQixT1CoTG0A"
# # losumipsum 
# export GEMINI_API_KEY="AIzaSyBtcOObbFOAl8N5tfh2rNY45jntHjTHQZo"

# export FORGE_KEY="sk-fg-v1-8cee5e75fded2fef7a0bbf3a680a4f36e24feb3b54e8c2b9d98c8f57a6a9fdf0"

# pnpm
export PNPM_HOME="/Users/kotakode/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
