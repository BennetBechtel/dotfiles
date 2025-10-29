# -----------------------------
# Only run the following for interactive shells
# -----------------------------
[[ $- != *i* ]] && return

# -----------------------------
# Keybinds
# -----------------------------
bindkey -e                        # Emacs-style keybindings
bindkey '^[[1;5D' backward-word   # Ctrl + left-arrow
bindkey '^[[1;5C' forward-word    # Ctrl + right-arrow
bindkey '^H' backward-kill-word   # Ctrl + backspace

# -----------------------------
# PATH
# -----------------------------
export PATH="$HOME/.local/bin:$PATH"

# -----------------------------
# Aliases
# -----------------------------
alias cls="reset"
alias vi="nvim"
alias yz="yazi"
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias nmtui-dark='(
  export TERM=xterm-256color
  export NCURSES_NO_UTF8_ACS=1
  # Temporarily remap color4 (blue) to dark background
  printf "\e]4;4;#1e1e2e\a"
  # Bright blue remains bright for selections
  printf "\e]4;12;#89b4fa\a"
  nmtui
  # Reset color4 back to normal after exit
  printf "\e]4;4;#89b4fa\a"
  printf "\e]4;12;#89b4fa\a"
)'

# -----------------------------
# History configuration
# -----------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# -----------------------------
# Plugins
# -----------------------------
# zoxide for fast directory jumping
eval "$(zoxide init zsh)"

# Autosuggestions (async for speed)
ZSH_AUTOSUGGEST_USE_ASYNC=1
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Syntax highlighting (must be last)
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# -----------------------------
# Prompt
# -----------------------------
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
else
    PROMPT='[%n@%m %1~]$ '
fi

# -----------------------------
# Pyenv lazy loading
# -----------------------------
if command -v pyenv >/dev/null 2>&1; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"

    pyenv() {
        unset -f pyenv
        eval "$(pyenv init --path)"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
        command pyenv "$@"
    }
fi
