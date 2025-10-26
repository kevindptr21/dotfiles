export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# PATH
export EDITOR="nvim"
export ANDROID_HOME="$HOME/Library/Android/sdk"
export NDK_HOME="$ANDROID_HOME/ndk/27.1.12297006"
export NVIM_DIR="$HOME/Dev/nvim-macos-arm64/bin"
# XAMPP
# export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/.local/bin:/Applications/XAMPP/xamppfiles/bin":$PATH
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/.local/bin:$NVIM_DIR":$PATH

# AMPPS
# export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/.local/bin:/Applications/AMPPS/apps/bin:/Applications/AMPPS/apps/php82/bin":$PATH
# export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/.local/bin":$PATH

source ~/.bash_profile
source ~/perl5/perlbrew/etc/bashrc

# zinit DIR
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if doesnt exist
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# # Starship
# zinit ice as"command" from"gh-r" \
#           atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
#           atpull"%atclone" src"init.zsh"
# zinit light starship/starship

# Plugins
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

# Aliases
alias ls='ls --color'
alias v='nvim'
alias c='clear'
# temporary
alias python=/usr/bin/python3
# alias python=/Library/Frameworks/Python.framework/Versions/3.12/bin/python3
alias mysql=/usr/local/mysql/bin/mysql
alias gpbt="git push git@github.com:bbs-lms/bbs-teacher.git"
alias gpbs="git push git@github.com:bbs-lms/bbs-student.git"
alias gpm="git push git@github.com:bbs-lms/bbs-teacher.git && git push git@github.com:bbs-lms/bbs-student.git"
alias emu="./Library/Android/sdk/emulator/emulator" # emulator

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# Yazi setup
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
export ICU_ROOT=$(brew --prefix icu4c)
export LDFLAGS="-L$ICU_ROOT/lib"
export CPPFLAGS="-I$ICU_ROOT/include"
export PKG_CONFIG_PATH="$ICU_ROOT/lib/pkgconfig"

# #kevind.dwiputra6
# export GEMINI_API_KEY="AIzaSyBqm_e6LGm7LwnuvgF7Uo_H93qHHl2_OGM"
# # enokki
# export GEMINI_API_KEY="AIzaSyAWiXWFy6IzGGFc8VsvsdKVzPESVbmtjbY"
#  kevindptr
export GEMINI_API_KEY="AIzaSyBuZhgc_NDxZ7VEQjakKop6hW4lWbjuHCE"
# # bblekutek
# export GEMINI_API_KEY="AIzaSyBbOu2b2pEO8O92wKh770URQixT1CoTG0A"
# # losumipsum 
# export GEMINI_API_KEY="AIzaSyBtcOObbFOAl8N5tfh2rNY45jntHjTHQZo"

export FORGE_KEY="sk-fg-v1-8cee5e75fded2fef7a0bbf3a680a4f36e24feb3b54e8c2b9d98c8f57a6a9fdf0"

# pnpm
export PNPM_HOME="/Users/kotakode/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
